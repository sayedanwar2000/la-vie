import 'dart:async';

import 'package:flutter/material.dart';
import 'package:la_vie/share/components/LogoLaVie.dart';
import 'package:la_vie/share/components/NavigateAndFinish.dart';
import 'package:la_vie/share/style/colors.dart';
import 'package:la_vie/view/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 3),
          () {
        navigateAndFinish(context, const LoginScreen());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColorWhite,
      body: Center(
        child: logoLaVie(
          fontSize: 35,
          left: 60,
          top: 25,
          width: 32,
          height: 22,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
