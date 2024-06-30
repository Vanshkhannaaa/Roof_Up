import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:roof_up/auth/phone_login.dart';
import 'package:roof_up/nav_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<bool> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('uid')!);
    return prefs.getBool('isLoggedIn') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: Image.asset('assets/images/splash2.gif'),
        nextScreen: FutureBuilder<bool>(
          future: checkLoginStatus(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            } else {
              if (snapshot.data == true) {
                return NavPage();
              } else {
                return PhoneLogin();
              }
            }
          },
        ),
        duration: 3400,
        splashIconSize: double.infinity,
        backgroundColor: Color(0xff2B64F8),
      ),
    );
  }
}
