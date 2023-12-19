import 'package:flutter/material.dart';

Widget defaultButton({
  String? text,
  required function,
  required Color color,
  colorText,
  widget,
  double? width,
}) =>
    Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if(width != null)
            Container(
              color: Colors.transparent,
              width: width,
            ),
          MaterialButton(
            onPressed: function,
            child: widget ??
                Text(
                  text ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: colorText ?? Colors.white,
                    fontFamily: 'Roboto',
                  ),
                ),
          ),
        ],
      ),
    );