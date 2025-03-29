import 'package:flutter/material.dart';

class CLockIcon extends StatelessWidget {
  const CLockIcon({super.key});
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.timer_rounded,
      color: Color.fromARGB(255, 189, 147, 249),
      size: 40,
    );
  }
}
