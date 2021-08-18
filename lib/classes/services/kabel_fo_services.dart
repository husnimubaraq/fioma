import 'dart:convert';

import 'package:fioma/classes/services/service.dart';
import 'package:fioma/models/kabel_fo.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

abstract class _KabelFoServices extends GetxService {
  Future<List<KabelFO>> getKabelFo(Map<String, String> body);
}

class KabelFoServices extends _KabelFoServices {
  @override
  Future<List<KabelFO>> getKabelFo(Map<String, String> body) async {
    String url = 'https://wearefioma.com/v1/api-kabel-fo/list';
    String res = await Service.request(url, body);

    Map<String, dynamic> response = jsonDecode(res);

    bool status = response['status'];

    if (status == false) {
      return [];
    }
    // response['data']['list']
    List data = response['data']['list'];
    List<KabelFO> list = data.map((e) => KabelFO.fromJson(e)).toList();

    return list;
  }
}
