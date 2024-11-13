import 'package:flutter/material.dart';

import 'main_screen.dart';

void main() => runApp(const CHOAApp());

class CHOAApp extends StatefulWidget {
  const CHOAApp({super.key});

  @override
  State<CHOAApp> createState() => _CHOAAppState();
}

class _CHOAAppState extends State<CHOAApp> {
  bool _isDarkMode = false;
  double _textSize = 24.0;

  void _toggleDarkMode(bool value) {
    setState(() {
      _isDarkMode = value;
    });
  }

  void _changeTextSize(double value) {
    setState(() {
      _textSize = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CHOA Mobile App',
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: MainScreen(
        isDarkMode: _isDarkMode,
        textSize: _textSize,
        onDarkModeToggle: _toggleDarkMode,
        onTextSizeChange: _changeTextSize,
      ),
    );
  }
}
