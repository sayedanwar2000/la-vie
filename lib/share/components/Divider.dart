import 'package:flutter/material.dart';
import 'package:la_vie/share/style/colors.dart';

Widget myDivider({
  double? width,
}) =>
    Container(
      width: width ?? double.infinity,
      height: 1.0,
      color: defaultColorGrey97,
    );