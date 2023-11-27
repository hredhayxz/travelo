import 'package:get/get.dart';
import 'package:travelo/presentation/state_holders/auth/signup_screen_controller.dart';

class StateHolderBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(SignUpScreenController());
  }
}
