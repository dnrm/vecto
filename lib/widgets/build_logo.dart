import 'package:flutter/material.dart';
import 'package:vecto/constants.dart';

// ignore: unused_element
class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildLogo();
  }

  Widget _buildLogo() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.pentagon_outlined,
          color: primaryLight,
          size: 40,
        ),
        SizedBox(width: 2.5),
        Text(
          'VECTO',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: primaryLight,
            letterSpacing: -1.5,
          ),
        ),
      ],
    );
  }
}
