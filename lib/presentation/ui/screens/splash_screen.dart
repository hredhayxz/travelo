import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:travelo/presentation/state_holders/auth/auth_and_navigation_controller.dart';
import 'package:travelo/presentation/ui/screens/auth/signin_screen.dart';
import 'package:travelo/presentation/ui/screens/auth/signup_screen.dart';
import 'package:travelo/presentation/ui/screens/home_screen.dart';
import 'package:travelo/presentation/ui/utility/assets_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToNextScreen();
  }

  Future<void> goToNextScreen() async {
    await AuthAndNavigationController.getAccessToken();
    await AuthAndNavigationController.getAppInstallValue();
    await Future.delayed(const Duration(seconds: 2));
    if (AuthAndNavigationController.isFirstTimeOpening ?? true) {
      await AuthAndNavigationController.setAppInstallValue(false);
      Get.offAll(() => const SignUpScreen());
    } else {
      if (!AuthAndNavigationController.isLoggedIn) {
        Get.offAll(() => const SignInScreen());
      } else {
        Get.offAll(() => const HomeScreen());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SvgPicture.asset(
              AssetsPath.splashBgSVG,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Center(
              child: SvgPicture.asset(
                AssetsPath.traveloLogoSVG,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
