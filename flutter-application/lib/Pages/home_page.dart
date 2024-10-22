import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final double textSize;
  const HomePage({super.key, required this.textSize});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Home Page - Empty!',
        style: TextStyle(
            fontFamily: 'Sans-serif',
            fontSize: textSize,
            color: const Color(0xFF00A94F)),
      ),
    );
  }
}
