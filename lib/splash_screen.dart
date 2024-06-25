import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:roof_up/auth/phone_login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: Image.asset('assets/images/splash2.gif'),
        nextScreen: PhoneLogin(),
        duration: 3000,
        splashIconSize: double.infinity,
        backgroundColor: Color(0xff2B64F8),
      ),
    );
  }
}
