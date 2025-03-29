import 'package:chess_clock_app/models/time.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Clock extends StatelessWidget {
  const Clock({
    required this.time,
    required this.backgroundColor,
    required this.onTap,
    super.key,
  });
  final Time time;
  final VoidCallback onTap;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      color: backgroundColor,
      child: Center(
        child: GestureDetector(
          onTap: onTap,
          child: Text(
            time.toString(),
            style: GoogleFonts.orbitron(
              color: Color.fromARGB(255, 248, 248, 242),
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
