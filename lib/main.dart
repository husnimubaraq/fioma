import 'dart:convert';

import 'package:fioma/classes/services/auth_services.dart';
import 'package:fioma/classes/services/notification_service.dart';
import 'package:fioma/controllers/auth_controller.dart';
import 'package:fioma/controllers/auth_state.dart';
import 'package:fioma/controllers/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'classes/shared/shared.dart';
import 'classes/shared/shared_pref.dart';
import 'views/pages/pages.dart';

void main() async {
  // initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<void> init() async {}

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Themes.primaryColor,
      //systemNavigationBarColor: Colors.grey[300],
      //systemNavigationBarIconBrightness: Brightness.dark,
      //statusBarIconBrightness: Brightness.light
    ));

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: _MyApp(),
    );
  }
}

class _MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<_MyApp> {
  final AuthController controller =
      Get.put(AuthController(Get.put(AuthenticationService())));

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  initializeFCM() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        if (controller.state is Authenticated) {
          final NotificationController notificationController =
              Get.put(NotificationController(Get.put(NotificationServices())));
          notificationController.reset();
        }
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: ");
        // print(message);
        for (var vk in message.entries) {
          if (vk.key == "data") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    NotificationDetailPage(id: int.parse(vk.value['id'])),
              ),
            );
          }
        }
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(
            sound: true, badge: true, alert: true, provisional: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);

      SharedPref.saveToken(token);
    });
  }

  @override
  void initState() {
    super.initState();
    initializeFCM();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(() {
      if (controller.state is UnAuth) {
        return LoginPage();
      }

      if (controller.state is Authenticated) {
        return MainPage();
      }

      return SplashPage();
    });
  }
}
