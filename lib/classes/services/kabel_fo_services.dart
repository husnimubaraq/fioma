import 'dart:convert';

import 'package:fioma/classes/services/service.dart';
import 'package:fioma/models/kabel_fo.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

abstract class _KabelFoServices extends GetxService {
  Future<dynamic> getKabelFo(Map<String, String> body);
  Future<dynamic> savePathInfo(Map<String, String> body);
}

class KabelFoServices extends _KabelFoServices {
  @override
  Future<dynamic> getKabelFo(Map<String, String> body) async {
    String url = 'https://wearefioma.com/v1/api-kabel-fo/list';
    String res = await Service.request(url, body);

    Map<String, dynamic> response = jsonDecode(res);

    var status = response['status'];

    if (status == "error") {
      return AuthException(message: response["message"]);
    }

    if (status == false) {
      return [];
    }

    if (response['data'] == null) {
      return [];
    }

    List data = response['data']['list'];
    List<KabelFO> list = data.map((e) => KabelFO.fromJson(e)).toList();

    return list;
  }

  @override
  Future<dynamic> savePathInfo(Map<String, String> body) async {
    String url = 'https://wearefioma.com/v1/api-kabel-fo/update-path';
    String res = await Service.request(url, body);

    Map<String, dynamic> response = jsonDecode(res);

    var status = response['status'];

    if (status == "error") {
      return AuthException(message: response["message"]);
    }

    if (status == "failed") {
      return null;
    }
    return KabelFO.fromJson(response['data']);
  }
}
