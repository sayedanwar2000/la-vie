import 'package:flutter/material.dart';
import 'package:la_vie/share/style/colors.dart';
import 'package:la_vie/view/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: defaultColorGreen),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}