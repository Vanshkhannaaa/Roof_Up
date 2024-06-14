import 'package:flutter/material.dart';
import 'package:roof_up/Common/appBar.dart';

class Summary extends StatefulWidget {
  const Summary({super.key});

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        name: 'Summary',
        home: false,
      ),
    );
  }
}
