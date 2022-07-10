import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:first_app/CoverPage/CoverPage.dart';
import 'package:first_app/Home/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:first_app/data/constants.dart' as constants;

void main() {
  runApp(const FirstApp());
}

class FirstApp extends StatelessWidget {
  const FirstApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: constants.APP_NAME,
        home: AnimatedSplashScreen(
          splash: const CoverPage(),
          nextScreen: const HomePage(),
          duration: constants.COVERPAGE_TIMEOUT,
          splashTransition: SplashTransition.fadeTransition,
        ));
  }
}
