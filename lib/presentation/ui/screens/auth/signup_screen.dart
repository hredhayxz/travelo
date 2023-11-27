import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:travelo/presentation/state_holders/auth/signup_screen_controller.dart';
import 'package:travelo/presentation/ui/screens/auth/otp_verification_screen.dart';
import 'package:travelo/presentation/ui/screens/auth/signin_screen.dart';
import 'package:travelo/presentation/ui/utility/assets_path.dart';
import 'package:travelo/presentation/ui/widgets/form_container.dart';
import 'package:travelo/presentation/ui/widgets/social_signup_logIn_section.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isButtonEnabled = false;

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
  );

  final RegExp passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
  );

  @override
  void initState() {
    super.initState();
    fullNameController.addListener(updateButtonState);
    emailController.addListener(updateButtonState);
    passwordController.addListener(updateButtonState);
    confirmPasswordController.addListener(updateButtonState);
  }

  void updateButtonState() {
    setState(() {
      isButtonEnabled = fullNameController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty &&
          confirmPasswordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        title: const Text('Sign up'),
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
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(47, 47, 47, 1),
                    ),
                  ),
                  const Text(
                    'Please sign up to continue',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(85, 85, 104, 1),
                    ),
                  ),
                  const SizedBox(height: 30),
                  FormContainer(
                    icon: Icons.person,
                    title: 'Your Full name',
                    hint: 'Mahmud Saimon',
                    keyboardType: TextInputType.name,
                    obscureText: false,
                    controller: fullNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  FormContainer(
                    icon: Icons.email_outlined,
                    title: 'Your Email',
                    hint: 'example@domain.com',
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!emailRegex.hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  FormContainer(
                    icon: Icons.lock_outline,
                    title: 'Password',
                    hint: '........',
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a password';
                      }
                      if (!passwordRegex.hasMatch(value)) {
                        return 'Password should have at least 1 uppercase, 1 lowercase, 1 digit, 1 special character, and be at least 8 characters long';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  FormContainer(
                    icon: Icons.lock_outline,
                    title: 'Confirm Password',
                    hint: '........',
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    controller: confirmPasswordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(
                    height: 20,
                  ),
                  GetBuilder<SignUpScreenController>(
                    builder: (signUpScreenController) {
                      if (signUpScreenController.signUpInProgress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return SizedBox(
                        height: 56,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              signUp(signUpScreenController);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: isButtonEnabled
                                ? const Color.fromRGBO(52, 152, 219, 1)
                                : const Color.fromRGBO(244, 244, 244, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: isButtonEnabled
                                  ? const Color.fromRGBO(255, 255, 255, 1)
                                  : const Color.fromRGBO(201, 201, 206, 1),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SocialSignUpLogInSection(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
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
                          'Sign in',
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

  Future<void> signUp(SignUpScreenController controller) async {
    final response = await controller.signUp(
      fullNameController.text.trim(),
      emailController.text.trim(),
      passwordController.text,
      confirmPasswordController.text,
    );
    if (response) {
      Get.offAll(() => OtpVerificationScreen(
          name: fullNameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text,
          tempOtp: controller.otpCode));
    } else {
      Get.snackbar(
        'Failed',
        'Sign up failed! Try again',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        borderRadius: 10,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
