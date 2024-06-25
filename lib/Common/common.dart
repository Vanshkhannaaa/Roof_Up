import 'package:flutter/material.dart';

class CommonClass extends StatelessWidget {
  const CommonClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: Colors.blue.shade800,
        ),
      ),
    );
  }

  // Making loader a static method
  static Widget loader(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: Colors.blue.shade800,
      ),
    );
  }
}
