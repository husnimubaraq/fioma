import 'package:http/http.dart' as http;

class Service {
  static final String BASE_URL =
      'Basic KmZpb21hdGVsa29tI2luZG9uZXNpYSo6ODg5YzA4MmMtNzVlNC0xMWViLTk0MzktMDI0MmFjMTMwMDAy';

  static Future<String> request(String url, Map<String, String> body) async {
    Map<String, String> headers = <String, String>{'Authorization': BASE_URL};

    var uri = Uri.parse(url);
    var request = http.MultipartRequest('POST', uri)
      ..headers.addAll(headers)
      ..fields.addAll(body);
    var res = await request.send();
    String response = await res.stream.bytesToString();

    return response;
  }
}

class AuthException implements Exception {
  final String message;

  AuthException({this.message = 'Unknown error occurred. '});
}
