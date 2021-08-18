import 'package:fioma/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPref {
  static void saveUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", json.encode(user));
  }

  static Future<User> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = prefs.getString('user') ?? "";

    User user;
    if (userJson == "") {
      return null;
    }

    Map<String, dynamic> responseUser = json.decode(userJson);
    user = User.fromJson(responseUser);

    return user;
  }

  static void deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
  }
}
