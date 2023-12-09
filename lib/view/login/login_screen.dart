import 'package:flutter/material.dart';
import 'package:la_vie/share/components/LogoLaVie.dart';
import 'package:la_vie/share/style/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColorWhite,
      body: Center(
        child: logoLaVie(
          fontSize: 36,
          left: 54,
          top: 8,
          width: 27,
          height: 17,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
