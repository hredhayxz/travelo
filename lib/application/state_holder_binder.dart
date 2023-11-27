import 'package:get/get.dart';
import 'package:travelo/presentation/state_holders/auth/otp_verification_controller.dart';
import 'package:travelo/presentation/state_holders/auth/signin_screen_controller.dart';
import 'package:travelo/presentation/state_holders/auth/signup_screen_controller.dart';

class StateHolderBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(SignUpScreenController());
    Get.put(OtpVerificationController());
    Get.put(SignInScreenController());
  }
}
