import 'package:fioma/classes/services/kabel_fo_services.dart';
import 'package:fioma/controllers/auth_controller.dart';
import 'package:fioma/controllers/auth_state.dart';
import 'package:fioma/models/kabel_fo.dart';
import 'package:fioma/models/user.dart';
import 'package:get/get.dart';

class KabelFoController extends GetxController {
  final KabelFoServices _kabelFoServices;
  final AuthController _authController = Get.find();
  User user;

  var isLoading = true.obs;
  List<KabelFO> kabels = List<KabelFO>().obs;

  KabelFoController(this._kabelFoServices);

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() async {
    isLoading(true);

    fetchData('');
  }

  void fetchData(String keyword) async {
    user = (_authController.state as Authenticated).user;

    Map<String, String> body = <String, String>{
      'session_id': user.sessionId,
      'keyword': keyword
    };

    kabels = await _kabelFoServices.getKabelFo(body);

    isLoading(false);
  }
}
