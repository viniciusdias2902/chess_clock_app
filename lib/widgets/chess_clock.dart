import 'dart:async';

import 'package:chess_clock_app/models/time.dart';
import 'package:chess_clock_app/widgets/clock.dart';
import 'package:flutter/material.dart';

class ChessClock extends StatefulWidget {
  const ChessClock({super.key});
  @override
  State<ChessClock> createState() => _ChessClockState();
}

class _ChessClockState extends State<ChessClock> {
  final _timePlayerOne = Time(hours: 0, minutes: 20, seconds: 0);
  final _timePlayerTwo = Time(hours: 0, minutes: 20, seconds: 0);
  Timer? _activeTimer;
  bool isPlayerOneTurn = true;

  Color backgroundColorPlayerOne = Color.fromARGB(255, 40, 42, 54);
  Color backgroundColorPlayerTwo = Color.fromARGB(255, 40, 42, 54);

  void switchPlayer() {
    setState(() {
      isPlayerOneTurn = !isPlayerOneTurn;
    });
    startTimer();
  }

  void startTimer() {
    _activeTimer?.cancel();
    _activeTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (!isPlayerOneTurn) {
          validateAndUpdateTimer(_timePlayerOne, timer);
        } else {
          validateAndUpdateTimer(_timePlayerTwo, timer);
        }
      });
    });
  }

  void validateAndUpdateTimer(Time time, Timer timer) {
    if (time.hours > 0 || time.minutes > 0 || time.seconds > 0) {
      modifyTime(time);
    } else {
      timer.cancel();
    }
  }

  void modifyTime(Time time) {
    if (time.hours > 0 || time.minutes > 0 || time.seconds > 0) {
      if (time.seconds > 0) {
        time.seconds--;
      }
      if (time.seconds == 0 && time.minutes > 0) {
        time.seconds = 60;
        time.minutes--;
      }
      if (time.minutes == 0 && time.hours > 0) {
        time.minutes = 60;
        time.hours--;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 40, 42, 54),
      body: Column(
        children: [
          Expanded(
            child: Clock(
              time: _timePlayerOne,
              isPlayerOneTurn: isPlayerOneTurn,
              onTap: switchPlayer,
            ),
          ),
          Divider(
            height: 10,
            thickness: 10,
            color: Color.fromARGB(255, 248, 248, 242),
          ),
          Expanded(
            child: Clock(
              time: _timePlayerTwo,
              isPlayerOneTurn: !isPlayerOneTurn,
              onTap: switchPlayer,
            ),
          ),
        ],
      ),
    );
  }
}
