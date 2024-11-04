import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  final double textSize;
  const MapPage({super.key, required this.textSize});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height * .7;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InteractiveViewer(
              panEnabled: true,
              child: Image.asset(
                'assets/mock_app.png',
                width: screenHeight * 0.75,
                height: screenHeight,
              ))
        ],
      ),
    );
  }
}
