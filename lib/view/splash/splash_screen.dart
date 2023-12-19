import 'dart:async';

import 'package:flutter/material.dart';
import 'package:la_vie/share/components/LogoLaVie.dart';
import 'package:la_vie/share/components/NavigateAndFinish.dart';
import 'package:la_vie/share/style/colors.dart';
import 'package:la_vie/view/layouts/layout_start_screen.dart';
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
      const Duration(seconds: 2),
          () {
        navigateAndFinish(context, LayoutStartScreen());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: defaultColorWhite,
      body: Center(
        child: logoLaVie(
          fontSize: 36,
          left: width * 0.14,
          top: height * 0.01,
          width: 27,
          height: 17,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
