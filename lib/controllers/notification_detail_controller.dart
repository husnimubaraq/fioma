import 'package:fioma/classes/services/notification_service.dart';
import 'package:fioma/classes/services/service.dart';
import 'package:fioma/controllers/notification_controller.dart';
import 'package:fioma/models/PaginationFilter.dart';
import 'package:fioma/models/notification.dart';
import 'package:fioma/views/pages/pages.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';
import 'auth_state.dart';

class NotificationDetailController extends GetxController {
  final AuthController _authController = Get.find();
  final NotificationController _notificationController = Get.find();
  final NotificationServices _notificationServices;
  final notification = ListElement().obs;

  NotificationDetailController(this._notificationServices);

  Future<void> init(int id) async {
    final user = (_authController.state as Authenticated).user;

    Map<String, String> body = <String, String>{
      'session_id': user.sessionId,
      'id': id.toString()
    };

    var response = await _notificationServices.updateStatus(body);

    if (response is AuthException) {
      Get.offAll(LoginPage());
      _authController.requestLogout();
    } else {
      ListElement dataNotifications = response;

      notification.value = dataNotifications;

      var data = _notificationController.notifications;
      int index =
          data.indexWhere((element) => element.id == dataNotifications.id);

      data[index] = dataNotifications;

      _notificationController.updateNotif(data);
    }
  }
}
