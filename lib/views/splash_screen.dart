import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:mizan_app/views/register_screen.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Size mediaquery = MediaQuery.of(context).size;
    return AnimatedSplashScreen(
      splash: 'assets/images/mizan.png',
      nextScreen: const RegisterScreen(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      backgroundColor: Colors.black,
      animationDuration: const Duration(seconds: 5),
      splashIconSize: mediaquery.height * .7,
      centered: true,
    );
  }
}
