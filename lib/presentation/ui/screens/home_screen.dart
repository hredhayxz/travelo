import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelo/presentation/state_holders/auth/auth_and_navigation_controller.dart';
import 'package:travelo/presentation/ui/screens/auth/signin_screen.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:travelo/presentation/ui/screens/bottom_nav_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _bottomNavIndex = 0;

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
                await AuthAndNavigationController.clear();
                await AuthAndNavigationController.setAppInstallValue(false);
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
      floatingActionButton: ClipOval(
        child: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(52, 152, 219, 1),
          onPressed: () {},
          child: const Icon(
            Icons.star,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar:
          GetBuilder<BottomNavController>(builder: (bottomNavController) {
        return AnimatedBottomNavigationBar(
          activeColor: const Color.fromRGBO(52, 152, 219, 1),
          icons: const [Icons.home, Icons.favorite, Icons.person],
          activeIndex: bottomNavController.selectedIndex,
          gapLocation: GapLocation.end,
          notchSmoothness: NotchSmoothness.defaultEdge,
          onTap: (index) {
            bottomNavController.changeScreen(index);
          }, // Default color
        );
      }),
    );
  }
}
