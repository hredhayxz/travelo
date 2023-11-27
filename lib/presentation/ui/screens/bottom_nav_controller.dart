import 'package:get/get.dart';

class BottomNavController extends GetxController {
  int selectedIndex = 0;

  changeScreen(int index) {
    selectedIndex = index;
    update();
  }
}
