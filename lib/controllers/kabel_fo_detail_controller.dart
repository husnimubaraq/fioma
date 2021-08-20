import 'package:fioma/classes/services/kabel_fo_services.dart';
import 'package:fioma/controllers/auth_controller.dart';
import 'package:fioma/controllers/auth_state.dart';
import 'package:fioma/models/kabel_fo.dart';
import 'package:fioma/models/user.dart';
import 'package:get/get.dart';

class KabelFoDetailController extends GetxController {
  final AuthController _authController = Get.find();

  final kabelFO = KabelFO().obs;

  void init(KabelFO _kabelFO) {
    kabelFO.value = _kabelFO;
  }
}
