import 'dart:convert';

import 'package:fioma/classes/services/kabel_fo_services.dart';
import 'package:fioma/classes/services/service.dart';
import 'package:fioma/controllers/auth_controller.dart';
import 'package:fioma/controllers/auth_state.dart';
import 'package:fioma/controllers/kabel_fo_controller.dart';
import 'package:fioma/controllers/kabel_fo_detail_controller.dart';
import 'package:fioma/models/kabel_fo.dart';
import 'package:fioma/models/user.dart';
import 'package:fioma/views/pages/pages.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MapAddController extends GetxController {
  final AuthController _authController = Get.find();
  final KabelFoDetailController _kabelFoDetailController = Get.find();
  final KabelFoController _kabelFoController = Get.find();
  final KabelFoServices _kabelFoServices;

  User user;

  MapAddController(this._kabelFoServices);

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() async {
    user = (_authController.state as Authenticated).user;
  }

  void updatePath(List<String> pathInfo, int id) async {
    user = (_authController.state as Authenticated).user;

    Map<String, String> body = <String, String>{
      'session_id': user.sessionId,
      'path_info': jsonEncode(pathInfo),
      'id': id.toString()
    };

    var response = await _kabelFoServices.savePathInfo(body);

    if (response is AuthException) {
      Get.offAll(LoginPage());
      _authController.requestLogout();
    } else {
      _kabelFoDetailController.kabelFO.value = response;
      Map<String, String> body2 = <String, String>{
        'session_id': user.sessionId,
        'keyword': ""
      };

      _kabelFoController.kabels.value =
          await _kabelFoServices.getKabelFo(body2);

      Get.back();
    }
  }
}
