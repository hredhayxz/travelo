import 'package:get/get.dart';
import 'package:travelo/data/models/network_response.dart';
import 'package:travelo/data/services/network_caller.dart';
import 'package:travelo/data/utility/urls.dart';

class OtpVerificationController extends GetxController {
  bool _otpVerificationProgress = false;
  String _message = '';

  bool get otpVerificationProgress => _otpVerificationProgress;

  String get message => _message;

  Future<bool> verifyOtp(String name, String email, String password,
      String tempOtp, String inpOtp, ) async {
    _otpVerificationProgress = true;
    update();
    Map<String, dynamic> requestBody = {
      "name": name,
      "email": email,
      "password": password,
      "temp_otp": tempOtp,
      "otp_code": inpOtp,
    };
    final NetworkResponse response =
    await NetworkCaller().postRequest(Urls.verifyOtp, requestBody);
    _otpVerificationProgress = false;
    update();
    print(response.isSuccess);
    if (response.isSuccess) {
      return true;
    } else {
      _message = 'Otp verification failed! Try again';
      return false;
    }
  }
}
