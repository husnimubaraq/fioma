import 'dart:convert';

import 'package:fioma/classes/shared/shared_pref.dart';
import 'package:fioma/controllers/auth_controller.dart';
import 'package:fioma/controllers/auth_state.dart';
import 'package:fioma/models/user.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProfileController extends GetxController {
  final AuthController _authController = Get.find();
  User user;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() async {
    user = (_authController.state as Authenticated).user;
  }

  void logout() {
    _authController.requestLogout();
  }
}
