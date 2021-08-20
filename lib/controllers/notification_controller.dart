import 'package:fioma/classes/services/notification_service.dart';
import 'package:fioma/classes/services/service.dart';
import 'package:fioma/models/PaginationFilter.dart';
import 'package:fioma/models/notification.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';
import 'auth_state.dart';

class NotificationController extends GetxController {
  final AuthController _authController = Get.find();
  final NotificationServices _notificationServices;

  final _notifications = <ListElement>[].obs;
  final _page = 1.obs;
  final _lastPage = false.obs;

  NotificationController(this._notificationServices);

  List<ListElement> get notifications => _notifications.toList();
  int get page => _page.value;
  bool get lastPage => _lastPage.value;

  @override
  void onInit() {
    ever(_page, (_) => getAllNotifications());
    changePaginationFilter(1);
    super.onInit();
  }

  Future<void> getAllNotifications() async {
    final user = (_authController.state as Authenticated).user;

    Map<String, String> body = <String, String>{
      'session_id': user.sessionId,
      'page': _page.value.toString()
    };

    var response = await _notificationServices.getNotifications(body);

    if (response is AuthException) {
      _authController.requestLogout();
    } else {
      Notifications dataNotifications = response;

      if (dataNotifications.list.isEmpty) {
        _lastPage.value = true;
      }

      _notifications.addAll(dataNotifications.list);
    }
  }

  void reset() {
    if (page > 1) {
      _notifications.clear();
      changePaginationFilter(1);
    }
  }

  void updateNotif(List<ListElement> list) {
    _notifications.value = list;
  }

  void changePaginationFilter(int page) {
    _page.value = page;
  }

  void loadNextPage() => changePaginationFilter(page + 1);
}
