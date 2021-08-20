import 'dart:async';

import 'package:fioma/classes/services/kabel_fo_services.dart';
import 'package:fioma/classes/services/service.dart';
import 'package:fioma/controllers/auth_controller.dart';
import 'package:fioma/controllers/auth_state.dart';
import 'package:fioma/models/kabel_fo.dart';
import 'package:fioma/models/user.dart';
import 'package:fioma/views/pages/pages.dart';
import 'package:get/get.dart';

class KabelFoController extends GetxController {
  final KabelFoServices _kabelFoServices;
  final AuthController _authController = Get.find();
  User user;

  var isLoading = true.obs;
  final kabels = List<KabelFO>().obs;
  Timer _debounce;

  KabelFoController(this._kabelFoServices);

  @override
  void dispose() {
    // TODO: implement dispose
    _debounce?.cancel();
    super.dispose();
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() async {
    isLoading(true);

    fetchData('');
  }

  void onChangeText(String query) {
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      fetchData(query);
    });
  }

  void fetchData(String keyword) async {
    user = (_authController.state as Authenticated).user;

    Map<String, String> body = <String, String>{
      'session_id': user.sessionId,
      'keyword': keyword
    };

    var response = await _kabelFoServices.getKabelFo(body);

    if (response is AuthException) {
      Get.offAll(LoginPage());
      _authController.requestLogout();
    } else {
      kabels.value = response;
    }

    isLoading(false);
  }

  void filterData(String keyword) async {
    if (keyword.length > 3) {
      fetchData(keyword);
    }
    {
      fetchData("");
    }
  }
}
