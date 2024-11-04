import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final bool isDarkMode;
  final double textSize;
  final Function(bool) onDarkModeToggle;
  final Function(double) onTextSizeChange;

  const SettingsPage({
    super.key,
    required this.isDarkMode,
    required this.textSize,
    required this.onDarkModeToggle,
    required this.onTextSizeChange,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool _isDarkMode;
  late double _textSize;

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.isDarkMode;
    _textSize = widget.textSize;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings'),
        backgroundColor: const Color(0xFF00A94F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              title: const Text('Dark Mode'),
              value: _isDarkMode,
              onChanged: (bool value) {
                setState(() {
                  _isDarkMode = value;
                });
                widget.onDarkModeToggle(value);
              },
            ),
            const SizedBox(height: 20),
            const Text('Text Size',
                style: TextStyle(fontFamily: 'Sans-serif', fontSize: 18)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Aa',
                    style: TextStyle(fontFamily: 'Sans-serif', fontSize: 12)),
                Expanded(
                  child: Slider(
                    value: _textSize,
                    min: 12.0,
                    max: 36.0,
                    divisions: 2,
                    label: _textSize.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _textSize = value;
                      });
                      widget.onTextSizeChange(value);
                    },
                  ),
                ),
                const Text('Aa',
                    style: TextStyle(fontFamily: 'Sans-serif', fontSize: 36)),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Settings Preview',
                style: TextStyle(fontFamily: 'Sans-serif', fontSize: _textSize),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
