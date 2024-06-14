import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:roof_up/auth/phone_login.dart';
import 'nav_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.blue.shade200,
            ],
          ),
        ),
        child: AnimatedSplashScreen(
          splash: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/animations/building2.json',
                ),
                SizedBox(height: 20),
                Text('ROOF UP',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue.shade900,
                  ),
                ),
              ],
            ),
          ),
          nextScreen: PhoneLogin(),
          duration: 2500,
          splashIconSize: 500,
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.transparent, // Set transparent to let the gradient show
        ),
      ),
    );
  }
}