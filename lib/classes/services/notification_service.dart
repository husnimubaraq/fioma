import 'dart:convert';

import 'package:fioma/classes/services/service.dart';
import 'package:fioma/models/notification.dart';
import 'package:get/get.dart';

abstract class _NotificationServices extends GetxService {
  Future<dynamic> getNotifications(Map<String, String> body);
  Future<dynamic> updateStatus(Map<String, String> body);
}

class NotificationServices extends _NotificationServices {
  @override
  Future<dynamic> getNotifications(Map<String, String> body) async {
    // TODO: implement getNotifications
    String url = 'https://wearefioma.com/v1/api-notification/list';
    String res = await Service.request(url, body);

    Map<String, dynamic> response = jsonDecode(res);

    var status = response['status'];

    if (status == "error") {
      return AuthException(message: response["message"]);
    }

    return Notifications.fromJson(response["data"]);
  }

  @override
  Future<dynamic> updateStatus(Map<String, String> body) async {
    // TODO: implement updateStatus
    String url =
        'https://wearefioma.com/v1/api-notification/update-status-read';
    String res = await Service.request(url, body);

    Map<String, dynamic> response = jsonDecode(res);

    var status = response['status'];

    if (status == "error" || status == "failed") {
      return AuthException(message: response["message"]);
    }

    return ListElement.fromJson(response["data"]);
  }
}
