import 'package:flutter/material.dart';

Widget logoLaVie({
  required double fontSize,
  required double left,
  required double top,
  required double width,
  required double height,
  required FontWeight fontWeight,
}) => Stack(
  children: [
    Text(
      'La Vie',
      style: TextStyle(
        fontFamily: 'Meddon',
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    ),
    Positioned(
      top: top,
      left: left,
      child: Image.asset(
        'assets/images/Planty.png',
        fit: BoxFit.cover,
        width: width ,
        height: height ,
      ),
    ),
  ],
);