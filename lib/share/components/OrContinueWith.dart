import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:la_vie/share/components/Divider.dart';
import 'package:la_vie/share/style/colors.dart';

Widget orContinueWith() => Column(
      children: [
        Row(
          children: [
            Expanded(child: myDivider()),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Text(
                'or continue with',
                style: TextStyle(
                  color: defaultColorGrey97,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(child: myDivider()),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/Google.png'),
            SizedBox(
              width:20,
            ),
            Image.asset('assets/images/Facebook.png'),
          ],
        ),
      ],
    );
