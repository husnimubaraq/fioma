import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'classes/shared/shared.dart';
import 'views/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      home: LoginPage(),
    );
  }
}
