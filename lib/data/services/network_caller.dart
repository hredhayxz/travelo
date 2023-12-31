import 'dart:developer';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:travelo/data/models/network_response.dart';

class NetworkCaller {

  /// post request method
  Future<NetworkResponse> postRequest(String url, Map<String, dynamic> body,
      {bool isLogin = false}) async {
    try {
      Response response = await post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          //'token': AuthController.accessToken.toString()
        },
        body: body,
      );
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200 || response.statusCode == 201 ) {
        return NetworkResponse(
          true,
          response.statusCode,
          jsonDecode(response.body),
        );
      }  else {
        log('I am error');
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }
}