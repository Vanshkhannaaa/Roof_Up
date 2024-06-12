import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roof_up/splash_screen.dart';

import 'auth/otp.dart';
import 'home/Installments/installment_calculator.dart';
import 'home/Installments/installment_page.dart';
import 'home/buy/Plot/plot_page.dart';
import 'home/buy/buy_page.dart';
import 'home/buy/feed/feed_page.dart';
import 'home/home_page.dart';
import 'home/sell/add_details.dart';
import 'home/sell/sell_fields/sell_flat.dart';
import 'home/sell/sell_fields/sell_guestroom.dart';
import 'home/sell/sell_fields/sell_halls.dart';
import 'home/sell/sell_fields/sell_house.dart';
import 'home/sell/sell_fields/sell_plot.dart';
import 'home/sell/sell_fields/sell_shop.dart';
import 'home/sell/sell_page.dart';
import 'home/sell/summary.dart';
import 'nav_page.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Property App',
      theme: ThemeData(
          fontFamily: GoogleFonts.montserrat().fontFamily
      ),
      debugShowCheckedModeBanner: false,
      // home: const MyHomePage(),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/nav': (context) => const NavPage(),
        '/home': (context) => const HomePage(),
        '/buy': (context) => const BuyPage(),
        '/buyplot': (context) => const PlotPage(),
        '/feed': (context) => const FeedPage(),
        '/installment': (context) => const InstallmentPage(),
        '/calculator': (context) => const Calculator(),
        '/sell': (context) => const SellPage(),
        '/otp': (context) => const otppage(),
        '/sellplot': (context) => const SellPlot(),
        '/sellhouse': (context) => const SellHouse(),
        '/sellshop': (context) => const SellShop(),
        '/sellflat': (context) => const SellFlat(),
        '/guestroom': (context) => const SellGuestRoom(),
        '/sellhall': (context) => const SellHalls(),
        '/details': (context) => const AddDetails(),
        '/summary': (context) => const Summary(),

      },
    );
  }
}