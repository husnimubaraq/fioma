import 'dart:convert';

import 'package:fioma/classes/services/auth_services.dart';
import 'package:fioma/classes/services/service.dart';
import 'package:fioma/classes/shared/shared_pref.dart';
import 'package:fioma/controllers/auth_state.dart';
import 'package:fioma/models/user.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final AuthServices _authServices;
  final _authStateStream = AuthState().obs;

  AuthState get state => _authStateStream.value;

  AuthController(this._authServices);

  @override
  void onInit() {
    _getAuthenticatedUser();
    super.onInit();
  }

  Future<dynamic> requestLogin(Map<String, String> body) async {
    var response = await _authServices.requestLogin(body);
    if (response is AuthException) {
      return response;
    } else {
      final user = response;
      _authStateStream.value = Authenticated(user: user);

      SharedPref.saveUser(user);

      return user;
    }
  }

  void requestLogout() async {
    User user = await SharedPref.getUser();

    String sessionId = "";

    if (user != null) {
      sessionId = user.sessionId;
    }

    Map<String, String> body = <String, String>{'session_id': sessionId};

    await _authServices.requestLogout(body);
    _authStateStream.value = UnAuth();

    SharedPref.deleteUser();
  }

  void _getAuthenticatedUser() async {
    User user = await SharedPref.getUser();

    String sessionId = "";

    if (user != null) {
      sessionId = user.sessionId;
    }

    Map<String, String> body = <String, String>{'session_id': sessionId};

    _authStateStream.value = AuthLoading();

    var response = await _authServices.getCurrentUser(body);

    if (response is AuthException) {
      _authStateStream.value = UnAuth();
    } else {
      _authStateStream.value = Authenticated(user: user);
    }
  }
}
