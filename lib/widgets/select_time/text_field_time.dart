import 'package:flutter/material.dart';

class TextFieldTime extends StatelessWidget {
  const TextFieldTime({
    super.key,
    required this.label,
    required this.textEditingController,
  });
  final String label;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        maxLength: 2,
        controller: textEditingController,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color.fromARGB(255, 248, 248, 242),
          fontSize: 40,
        ),
        decoration: InputDecoration(
          label: Text(
            label,
            style: TextStyle(
              color: Color.fromARGB(255, 248, 248, 242),
              fontSize: 18,
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
