import 'package:chess_clock_app/models/time.dart';
import 'package:flutter/material.dart';

class Clock extends StatelessWidget {
  const Clock({
    required this.time,
    required this.isPlayerOneTurn,
    required this.onTap,
    super.key,
  });
  final Time time;
  final VoidCallback onTap;
  final bool isPlayerOneTurn;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      color:
          isPlayerOneTurn
              ? Color.fromARGB(255, 255, 85, 85)
              : Color.fromARGB(255, 80, 250, 123),
      child: Center(
        child: GestureDetector(
          onTap: isPlayerOneTurn ? onTap : null,
          child: Text(
            time.toString(),
            style: TextStyle(
              color: Color.fromARGB(255, 248, 248, 242),
              fontSize: 42,
            ),
          ),
        ),
      ),
    );
  }
}
