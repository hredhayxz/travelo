import 'package:get/get.dart';
import 'package:travelo/data/models/network_response.dart';
import 'package:travelo/data/services/network_caller.dart';
import 'package:travelo/data/utility/urls.dart';

class SignUpScreenController extends GetxController {
  bool _signUpInProgress = false;
  String _message = '';

  bool get signUpInProgress => _signUpInProgress;

  String get message => _message;

  Future<bool> signUp(String name, String email, String password,String confirmPassword) async {
    _signUpInProgress = true;
    update();
    Map<String, dynamic> requestBody = {

        "name": [name],
        "email": [email],
        "password": [password],
        "password_confirmation": [confirmPassword]

    };
    final NetworkResponse response =
        await NetworkCaller().postRequest(Urls.userSignUp, requestBody);
    _signUpInProgress = false;
    update();
    if (response.isSuccess) {
      return true;
    } else {
      _message = 'Sign up failed! Try again';
      return false;
    }
  }
}
