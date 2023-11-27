import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:travelo/presentation/state_holders/auth/otp_verification_controller.dart';
import 'package:travelo/presentation/ui/screens/auth/signin_screen.dart';
import 'package:travelo/presentation/ui/utility/assets_path.dart';
import 'package:travelo/presentation/ui/widgets/congratulations_custom_dialog.dart';

class OtpVerificationScreen extends StatelessWidget {
  OtpVerificationScreen(
      {super.key,
      required this.name,
      required this.email,
      required this.password,
      required this.tempOtp});

  final String name;
  final String email;
  final String password;
  final String tempOtp;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _otpTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        title: const Text('Verify otp'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SvgPicture.asset(
                    AssetsPath.personIconSVG,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'OTP Verification!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(47, 47, 47, 1),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'A 4 digit OTP sent',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(85, 85, 104, 1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  PinCodeTextField(
                    autofocus: true,
                    controller: _otpTEController,
                    hideCharacter: false,
                    highlight: true,
                    highlightColor: Colors.blue,
                    defaultBorderColor: Colors.black,
                    hasTextBorderColor: Colors.green,
                    maxLength: 4,
                    pinBoxDecoration:
                        ProvidedPinBoxDecoration.underlinedPinBoxDecoration,
                    pinTextStyle: const TextStyle(fontSize: 30.0),
                    pinBoxHeight: 50.0,
                    pinBoxWidth: 50.0,
                    onDone: (pin) {
                      // Callback when the user completes entering the pin code
                      print("Pin: $pin");
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GetBuilder<OtpVerificationController>(
                      builder: (otpVerificationController) {
                    if (otpVerificationController.otpVerificationProgress) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return SizedBox(
                      height: 56,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          String enteredOTP = _otpTEController.text;
                          if (enteredOTP.length == 4) {
                            verifyOtp(otpVerificationController);
                          } else {
                            Get.snackbar(
                              'Incomplete',
                              'Please enter a valid 4-digit OTP',
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                              borderRadius: 10,
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor:
                              const Color.fromRGBO(52, 152, 219, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text(
                          'Verify',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Have an account?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(94, 96, 100, 1),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Get.offAll(() => const SignInScreen());
                        },
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(52, 152, 219, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> verifyOtp(OtpVerificationController controller) async {
    final response = await controller.verifyOtp(
        name, email, password, tempOtp, _otpTEController.text.trim());
    if (response) {
      Get.dialog(const CongratulationsCustomDialog());
    } else {
      _otpTEController.clear();
      Get.snackbar(
        'Failed',
        'Otp verification failed! Try again',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        borderRadius: 10,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
