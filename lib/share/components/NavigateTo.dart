import 'package:flutter/material.dart';

void navigateto(context, Widget widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);