import 'dart:convert';

import 'package:fioma/classes/services/service.dart';
import 'package:fioma/models/user.dart';
import 'package:get/get.dart';

abstract class AuthServices extends GetxService {
  Future<dynamic> getCurrentUser(Map<String, String> body);
  Future<dynamic> requestLogin(Map<String, String> body);
  Future<void> requestLogout(Map<String, String> body);
}

class AuthenticationService extends AuthServices {
  @override
  Future<dynamic> getCurrentUser(Map<String, String> body) async {
    String url = 'https://wearefioma.com/v1/api-authentication/session-check';
    String response = await Service.request(url, body);

    Map<String, dynamic> responseUser = jsonDecode(response);
    String status = responseUser['status'];

    if (status == "failed") {
      return AuthException(message: responseUser["status"]);
    }

    if (status == "error") {
      return AuthException(message: responseUser["status"]);
    }

    return User.fromJson(responseUser['data']['user']);
  }

  @override
  Future<dynamic> requestLogin(Map<String, String> body) async {
    String url = 'https://wearefioma.com/v1/api-authentication/login';
    String response = await Service.request(url, body);

    Map<String, dynamic> responseUser = jsonDecode(response);
    String status = responseUser['status'];

    if (status == "failed") {
      return AuthException(message: responseUser["message"]);
    }

    return User.fromJson(responseUser['data']['user']);
  }

  @override
  Future<void> requestLogout(Map<String, String> body) async {
    String url = 'https://wearefioma.com/v1/api-authentication/logout';
    String response = await Service.request(url, body);

    Map<String, dynamic> responseUser = jsonDecode(response);
    String status = responseUser['status'];

    if (status == "failed") {
      return null;
    }

    return null;
  }
}

// class AuthException implements Exception {
//   final String message;

//   AuthException({this.message = 'Unknown error occurred. '});
// }
