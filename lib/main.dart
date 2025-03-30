import 'package:chess_clock_app/models/time.dart';
import 'package:chess_clock_app/widgets/chess_clock/chess_clock.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ChessClock(time: Time(hours: 0, minutes: 30, seconds: 30)),
      ),
    ),
  );
}
