import 'package:flutter/material.dart';

class FormContainer extends StatelessWidget {
  const FormContainer({
    Key? key,
    required this.icon,
    required this.title,
    required this.hint,
    required this.keyboardType,
    required this.obscureText,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String hint;
  final TextInputType keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(227, 227, 227, 1),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: const Color.fromRGBO(121, 121, 121, 1),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(94, 96, 100, 1),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(158, 159, 167, 1),
                      ),
                      border: InputBorder.none,
                    ),
                    keyboardType: keyboardType,
                    obscureText: obscureText,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
