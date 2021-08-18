import 'dart:convert';

import 'package:fioma/classes/services/auth_services.dart';
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

  Future<void> requestLogin(Map<String, String> body) async {
    final user = await _authServices.requestLogin(body);
    _authStateStream.value = Authenticated(user: user);

    SharedPref.saveUser(user);
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

    final users = await _authServices.getCurrentUser(body);

    if (users == null) {
      _authStateStream.value = UnAuth();
    } else {
      _authStateStream.value = Authenticated(user: user);
    }
  }
}
