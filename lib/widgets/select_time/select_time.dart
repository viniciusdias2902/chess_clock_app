import 'package:chess_clock_app/models/time.dart';
import 'package:chess_clock_app/widgets/select_time/text_field_time.dart';
import 'package:flutter/material.dart';

class SelectTime extends StatelessWidget {
  SelectTime({super.key, required this.changeTime});

  final _hoursTextController = TextEditingController();
  final _minutesTextController = TextEditingController();
  final _secondsTextController = TextEditingController();
  final Function(Time time) changeTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 40, 42, 54),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextFieldTime(
                  label: 'Hours',
                  textEditingController: _hoursTextController,
                ),
              ),
              Expanded(
                child: TextFieldTime(
                  label: 'Minutes',
                  textEditingController: _minutesTextController,
                ),
              ),
              Expanded(
                child: TextFieldTime(
                  label: 'Seconds',
                  textEditingController: _secondsTextController,
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              int hours = int.tryParse(_hoursTextController.text)!;
              int minutes = int.tryParse(_minutesTextController.text)!;
              int seconds = int.tryParse(_secondsTextController.text)!;
              Time newTime = Time(
                hours: hours,
                minutes: minutes,
                seconds: seconds,
              );
              changeTime(newTime);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 68, 71, 90),
              foregroundColor: Color.fromARGB(255, 248, 248, 242),
              textStyle: TextStyle(fontSize: 18),
            ),
            child: Text('Start Chess Clock'),
          ),
        ],
      ),
    );
  }
}
