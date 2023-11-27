import 'dart:developer';

import 'package:get/get.dart';
import 'package:travelo/data/models/network_response.dart';
import 'package:travelo/data/services/network_caller.dart';
import 'package:travelo/data/utility/urls.dart';
import 'package:travelo/presentation/state_holders/auth/auth_controller.dart';

class SignInScreenController extends GetxController {
  bool _signInProgress = false;
  String _message = '';
  String _token = '';

  bool get signInProgress => _signInProgress;

  String get message => _message;

  Future<bool> signIn(String email, String password) async {
    _signInProgress = true;
    update();
    Map<String, dynamic> requestBody = {

      "email": email,
      "password": password,
    };
    final NetworkResponse response =
    await NetworkCaller().postRequest(Urls.signIn, requestBody);
    _signInProgress = false;
    update();
    print(response.isSuccess);
    if (response.isSuccess) {
      _token = response.responseJson!['token'].toString();
      await AuthController.setAccessToken(_token);
      log(_token);
      return true;
    } else {
      _message = 'Sign in failed! Try again';
      return false;
    }
  }
}
