import 'package:flutter/material.dart';
import 'package:travelo/presentation/ui/utility/assets_path.dart';
import 'package:travelo/presentation/ui/widgets/optional_signup_login_container.dart';

class SocialSignUpLogInSection extends StatelessWidget {
  const SocialSignUpLogInSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 75.0,
              height: 1.0,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(227, 227, 227, 1),
              ),
            ),
            const Text(
              'OR CONTINUE WITH',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(94, 96, 100, 1),
              ),
            ),
            Container(
              width: 75.0,
              height: 1.0,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(227, 227, 227, 1),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            OptionalSignUpLoginContainer(
                optionIcon: AssetsPath.googleIconSVG, optionTitle: 'Google'),
            const SizedBox(
              width: 12,
            ),
            OptionalSignUpLoginContainer(
                optionIcon: AssetsPath.facebookIconSVG,
                optionTitle: 'Facebook'),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
