import 'package:fioma/classes/services/auth_services.dart';
import 'package:fioma/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'login_state.dart';

class LoginController extends GetxController {
  final AuthController _authController = Get.find();

  final _loginStateStream = LoginState().obs;

  LoginState get state => _loginStateStream.value;

  void requestLogin(Map<String, String> body) async {
    _loginStateStream.value = LoginLoading();

    try {
      await _authController.requestLogin(body);
      _loginStateStream.value = LoginState();
    } on AuthException catch (e) {
      _loginStateStream.value = LoginFailure(error: e.message);
    }
  }
}
