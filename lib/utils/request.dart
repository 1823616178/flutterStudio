import 'dart:async';
import 'dart:convert' as convert;
import 'dart:io';
import 'package:http/http.dart' as http;

typedef RequestCallBack = void Function(Map data);

class HttpRequest {
  static requestGET(
      String authority, String unencodedPath, RequestCallBack callBack,
      [Map<String, String>? queryParameters]) async {
    try {
      var httpClient = HttpClient();
      var uri = Uri.http(authority, unencodedPath, queryParameters);
      var request = await httpClient.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(convert.utf8.decoder).join();
      Map data = convert.jsonDecode(responseBody);
      callBack(data);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  final baseUrl = "http://123.161.179.32:59573/api2";

  Future<dynamic> get(String url, {Map<String, String>? headers}) async {
    try {
      http.Response response =
          await http.get(baseUrl + url as Uri, headers: headers);
      final statusCode = response.statusCode;
      final body = response.body;
      var result = convert.jsonDecode(body);
      return result;
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<dynamic> post(String url, dynamic body,
      {Map<String, String>? headers}) async {
    try {
      http.Response response = await http.post(Uri.parse(baseUrl + url),
          body: convert.jsonEncode(body), headers: headers);
      final statusCode = response.statusCode;
      final responseBody = response.body;
      var result = convert.jsonDecode(responseBody);
      return result;
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
