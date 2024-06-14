import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Saved extends StatefulWidget {
  const Saved({super.key});

  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xFFE40303), // Red
              Color(0xFFFF8C00), // Orange
              Color(0xFFFFED00), // Yellow
            ]
          )
        ),
      ),
    );
  }
}
