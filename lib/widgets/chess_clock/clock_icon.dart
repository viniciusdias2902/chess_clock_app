import 'package:flutter/material.dart';

class CLockIcon extends StatelessWidget {
  const CLockIcon({super.key});
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.timer_rounded,
      color: Color.fromARGB(200, 40, 42, 54),
      size: 40,
    );
  }
}
