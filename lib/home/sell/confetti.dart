import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class Confetti extends StatefulWidget {
  const Confetti({Key? key}) : super(key: key);
  @override
  _ConfettiState createState() => _ConfettiState();
}

class _ConfettiState extends State<Confetti> {
  late ConfettiController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(duration: const Duration(seconds: 10));
    startConfetti();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // White background
      body: Stack(
        children: [
          Center(
            child: ScaleTransition(
              scale: CurvedAnimation(
                parent: AlwaysStoppedAnimation<double>(1.0),
                curve: Curves.easeOutBack, // Animation curve
              ),
            ),
          ),
          Positioned.fill(
            child: Center(
              child: Column(
                mainAxisSize:
                MainAxisSize.min, // Ensure the Column takes minimum space
                children: [
                  Icon(
                    Icons.check_circle_rounded,
                    size: 100,
                    color: Colors.blue, // Blue circle tick
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Property Added Successfully',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ConfettiWidget(
              confettiController: _controller,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              colors: const [Colors.blue, Colors.red, Colors.green],
            ),
          ),
        ],
      ),
    );
  }

  void startConfetti() {
    _controller.play();
  }
}