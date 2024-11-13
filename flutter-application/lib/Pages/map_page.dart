import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MapPage extends StatelessWidget {
  final double textSize;
  const MapPage({super.key, required this.textSize});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: InteractiveViewer(
        panEnabled: true,
        boundaryMargin: EdgeInsets.all(
            100), // Adds extra space around the SVG to avoid clipping
        minScale: 0.5,
        maxScale: 4.0,
        child: Center(
          child: SizedBox(
            width: screenSize.width *
                2, // Make the container twice the screen width
            height: screenSize.height *
                2, // Make the container twice the screen height
            child: SvgPicture.asset(
              'assets/images/mock_app_no_bg.svg',
              fit: BoxFit
                  .none, // Prevents resizing of SVG, allowing it to display fully
            ),
          ),
        ),
      ),
    );
  }
}
