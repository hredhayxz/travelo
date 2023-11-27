import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelo/presentation/state_holders/auth/auth_controller.dart';
import 'package:travelo/presentation/ui/screens/auth/signin_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 248, 253, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(242, 248, 253, 1),
        title: Row(
          children: [
            InkWell(
              onTap: () {},
              child: ClipOval(
                child: Container(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  height: 48,
                  width: 48,
                  child: const Icon(
                    Icons.person,
                    color: Color.fromRGBO(161, 186, 204, 1),
                    size: 24,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Hello, Adventurer!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(47, 47, 47, 1),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () async {
                Get.offAll(() => const SignInScreen());
                await AuthController.clear();
                final SharedPreferences prefs= await SharedPreferences.getInstance();
                prefs.setBool('is_first_time', false);
              },
              child: ClipOval(
                child: Container(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  height: 48,
                  width: 48,
                  child: const Icon(
                    Icons.logout_outlined,
                    color: Color.fromRGBO(68, 68, 72, 1),
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: const SafeArea(
        child: Center(
          child: Text(
            'Home',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(52, 152, 219, 1),
            ),
          ),
        ),
      ),
    );
  }
}
