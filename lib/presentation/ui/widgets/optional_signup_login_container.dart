import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OptionalSignUpLoginContainer extends StatelessWidget {
  const OptionalSignUpLoginContainer({
    super.key,
    required this.optionIcon,
    required this.optionTitle,
  });

  final String optionIcon;
  final String optionTitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromRGBO(227, 227, 227, 1),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              optionIcon,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              optionTitle,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(96, 96, 100, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
