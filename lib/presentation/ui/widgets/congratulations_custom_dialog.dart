import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelo/presentation/ui/utility/assets_path.dart';

import '../screens/home_screen.dart';

class CongratulationsCustomDialog extends StatelessWidget {
  const CongratulationsCustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      backgroundColor: const Color.fromRGBO(244, 244, 244, 1),
      content: SizedBox(
        width: 380,
        height: 440,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.cancel_outlined),
            ),
            Column(
              children: [
                Image(
                  image: AssetImage(
                    AssetsPath.congratsGIF,
                  ),
                  height: 188,
                  width: 188,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Congratulations!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(52, 152, 219, 1),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Your new account has been created successfully.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(94, 96, 100, 1),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(52, 152, 219, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(double.infinity, 56),
                  ),
                  onPressed: () {
                    Get.offAll(() => const HomeScreen());
                  },
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
