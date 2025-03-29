import 'dart:async';

import 'package:flutter/material.dart';

class ChessClock extends StatefulWidget {
  const ChessClock({super.key});
  @override
  State<ChessClock> createState() => _ChessClockState();
}

class _ChessClockState extends State<ChessClock> {
  int _timerOneCount = 60;
  int _timerTwoCount = 60;
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
          if (_timerOneCount > 0) {
            _timerOneCount--;
            backgroundColorPlayerOne = Color.fromARGB(255, 80, 250, 123);
            backgroundColorPlayerTwo = Color.fromARGB(255, 255, 85, 85);
          } else {
            timer.cancel();
          }
        } else {
          if (_timerTwoCount > 0) {
            _timerTwoCount--;
            backgroundColorPlayerTwo = Color.fromARGB(255, 80, 250, 123);
            backgroundColorPlayerOne = Color.fromARGB(255, 255, 85, 85);
          } else {
            timer.cancel();
          }
        }
      });
    });
  }

  void resetTimers() {
    setState(() {
      _timerOneCount = 60;
      _timerTwoCount = 60;
      isPlayerOneTurn = true;
      _activeTimer?.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 40, 42, 54),
      body: Column(
        children: [
          Expanded(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              color: backgroundColorPlayerOne,
              child: Center(
                child: GestureDetector(
                  onTap: isPlayerOneTurn ? switchPlayer : null,
                  child: Text(
                    _timerOneCount.toString(),
                    style: TextStyle(
                      color: Color.fromARGB(255, 248, 248, 242),
                      fontSize: 42,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Divider(
            height: 10,
            thickness: 10,
            color: Color.fromARGB(255, 248, 248, 242),
          ),
          Expanded(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              color: backgroundColorPlayerTwo,
              child: Center(
                child: GestureDetector(
                  onTap: isPlayerOneTurn ? null : switchPlayer,
                  child: Text(
                    _timerTwoCount.toString(),
                    style: TextStyle(
                      color: Color.fromARGB(255, 248, 248, 242),
                      fontSize: 42,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
