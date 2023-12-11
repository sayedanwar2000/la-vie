import 'package:flutter/material.dart';

Widget defaultTextButton({
  required function,
  required String text,
  TextStyle? textstyle,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text,
        //style: textstyle,
      ),
    );