import 'dart:async';

import 'package:chess_clock_app/models/time.dart';
import 'package:chess_clock_app/widgets/chess_clock/clock.dart';
import 'package:chess_clock_app/widgets/chess_clock/clock_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      } else {
        _playerOneColor = Color.fromARGB(255, 255, 85, 85);
        _playerTwoColor = Color.fromARGB(255, 80, 250, 123);
      }
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
          child: Clock(
            time: _timePlayerOne,
            backgroundColor: _playerOneColor,
            onTap: switchPlayer,
          ),
        ),
        Container(
          decoration: BoxDecoration(color: Color.fromARGB(255, 40, 42, 54)),
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CLockIcon(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Chess Clock',
                  style: GoogleFonts.tektur(
                    color: Color.fromARGB(255, 255, 121, 198),
                    fontSize: 30,
                  ),
                ),
              ),
              CLockIcon(),
            ],
          ),
        ),
        Expanded(
          child: Clock(
            time: _timePlayerTwo,
            backgroundColor: _playerTwoColor,
            onTap: switchPlayer,
          ),
        ),
      ],
    );
  }
}
