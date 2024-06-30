import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roof_up/auth/details.dart';
import 'package:roof_up/home/buy/feed/photo_slider.dart';
import 'package:roof_up/home/sell/confetti.dart';
import 'package:roof_up/home/sell/sell_fields/sell_plot/plot_sell_page.dart';
import 'package:roof_up/home/to_let/to_let_page.dart';
import 'package:roof_up/splash_screen.dart';
import 'auth/otp.dart';
import 'firebase_options.dart';
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
import 'home/sell/sell_fields/sell_plot/sell_plot.dart';
import 'home/sell/sell_fields/sell_shop.dart';
import 'home/sell/sell_page.dart';
import 'home/sell/summary.dart';
import 'nav_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roof Up',
      theme: ThemeData(fontFamily: GoogleFonts.montserrat().fontFamily),
      debugShowCheckedModeBanner: false,
      // home: const MyHomePage(),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/nav': (context) => const NavPage(),
        '/home': (context) => const HomePage(),
        '/buy': (context) => const BuyPage(),
        '/buyplot': (context) => const PlotPage(),
        // '/feed': (context) => const FeedPage(),
        '/installment': (context) => const InstallmentPage(),
        '/calculator': (context) => const Calculator(),
        '/confetti': (context) => const Confetti(),
        '/tolet': (context) => const ToLetPage(),
        '/details': (context) => const Details(),
        '/sell': (context) => const SellPage(),
        '/sellplot': (context) => const SellPlot(),
        '/sellhouse': (context) => const SellHouse(),
        '/sellshop': (context) => const SellShop(),
        '/sellflat': (context) => const SellFlat(),
        '/guestroom': (context) => const SellGuestRoom(),
        '/sellhall': (context) => const SellHalls(),
        // '/slider': (context) => PhotoSlider(),
        '/spp': (context) => SellPlotPage(),
      },
    );
  }
}
