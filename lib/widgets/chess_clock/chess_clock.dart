import 'dart:async';

import 'package:chess_clock_app/models/time.dart';
import 'package:chess_clock_app/widgets/chess_clock/clock.dart';
import 'package:flutter/material.dart';

class ChessClock extends StatefulWidget {
  const ChessClock({super.key, required this.time});
  final Time time;
  @override
  State<ChessClock> createState() => _ChessClockState();
}

class _ChessClockState extends State<ChessClock> {
  late final Time _timePlayerOne;
  late final Time _timePlayerTwo;
  Color _playerOneColor = Color.fromARGB(255, 80, 250, 123);
  Color _playerTwoColor = Color.fromARGB(255, 255, 85, 85);
  Timer? _activeTimer;
  bool isPlayerOneTurn = true;

  Color backgroundColorPlayerOne = Color.fromARGB(255, 40, 42, 54);
  Color backgroundColorPlayerTwo = Color.fromARGB(255, 40, 42, 54);

  void switchPlayer() {
    setState(() {
      if (isPlayerOneTurn) {
        _playerOneColor = Color.fromARGB(255, 80, 250, 123);
        _playerTwoColor = Color.fromARGB(255, 255, 85, 85);
        isPlayerOneTurn = !isPlayerOneTurn;
        startTimer(_timePlayerOne);
      } else {
        _playerOneColor = Color.fromARGB(255, 255, 85, 85);
        _playerTwoColor = Color.fromARGB(255, 80, 250, 123);
        isPlayerOneTurn = !isPlayerOneTurn;
        startTimer(_timePlayerTwo);
      }
    });
  }

  void startTimer(Time time) {
    _activeTimer?.cancel();
    _activeTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        validateAndUpdateTimer(time, timer);
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
  void initState() {
    _timePlayerOne = widget.time.copy();
    _timePlayerTwo = widget.time.copy();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: RotatedBox(
            quarterTurns: 2,
            child: Clock(
              time: _timePlayerOne,
              backgroundColor: _playerOneColor,
              onTap:
                  isPlayerOneTurn ? switchPlayer : () => _activeTimer?.cancel(),
            ),
          ),
        ),
        Divider(
          thickness: 10,
          height: 10,
          color: Color.fromARGB(255, 248, 248, 242),
        ),
        Expanded(
          child: Clock(
            time: _timePlayerTwo,
            backgroundColor: _playerTwoColor,
            onTap:
                !isPlayerOneTurn ? switchPlayer : () => _activeTimer?.cancel(),
          ),
        ),
      ],
    );
  }
}
