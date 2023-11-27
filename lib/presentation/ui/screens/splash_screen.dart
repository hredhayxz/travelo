import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:travelo/presentation/ui/screens/auth/signup_screen.dart';
import 'package:travelo/presentation/ui/utility/assets_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

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
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Get.offAll(() => SignUpScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255,255,255, 1),
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
