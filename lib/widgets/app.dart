import 'package:chess_clock_app/models/time.dart';
import 'package:chess_clock_app/widgets/chess_clock/chess_clock.dart';
import 'package:chess_clock_app/widgets/select_time/select_time.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  String currentScreen = 'select_time';
  late Time time;
  void changeTime(Time time) {
    setState(() {
      this.time = time;
      currentScreen = 'chess_clock';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          currentScreen == 'select_time'
              ? SelectTime(changeTime: changeTime)
              : ChessClock(time: time),
    );
  }
}
