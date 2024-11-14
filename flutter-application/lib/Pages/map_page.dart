import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_navigation_app/Utilities/map.dart';

class MapPage extends StatelessWidget {
  final double textSize;
  final String? currentLocation;
  final String? destination;
  const MapPage({super.key, required this.textSize, this.currentLocation, this.destination});

  @override
  Widget build(BuildContext context) {
    final pinColor = Colors.blue;
    final hallwayColor = Colors.amber;
    List<String> route = [];
    if(currentLocation != null && destination != null){
      Graph map = Graph();
      map.loadFromJson('assets/maps/atrium_f1.json');
      route = map.route(currentLocation!, destination!);
    }
    return Scaffold(
      body: InteractiveViewer(
        panEnabled: true,
        boundaryMargin: EdgeInsets.all(100),
        minScale: 0.5,
        maxScale: 4.0,
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final screenWidth = constraints.maxWidth;
              final screenHeight = constraints.maxHeight;
              return Stack(
                children: [
                  SizedBox(
                    width: screenWidth * 2,
                    height: screenHeight * 2,
                    child: SvgPicture.asset(
                      'assets/images/mock_app_no_bg.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  buildRoom(screenWidth, screenHeight, 0.05, 0.4, "J-135", pinColor),
                  buildRoom(screenWidth, screenHeight, 0.1, 0.4, "J-133", pinColor),
                  buildRoom(screenWidth, screenHeight, 0.14, 0.4, "J-131", pinColor),
                  buildRoom(screenWidth, screenHeight, 0.201, 0.4, "J-120", pinColor),
                  buildRoom(screenWidth, screenHeight, 0.27, 0.4, "J-109", pinColor),
                  buildRoom(screenWidth, screenHeight, 0.32, 0.4, "J-107", pinColor),
                  buildRoom(screenWidth, screenHeight, 0.37, 0.38, "J-105", pinColor),
                  buildRoom(screenWidth, screenHeight, 0.39, 0.3, "Stacks", pinColor),
                  buildRoom(screenWidth, screenHeight, 0.58, 0.3, "J-152", pinColor),
                  buildRoom(screenWidth, screenHeight, 0.58, 0.67, "J-151", pinColor),
                  buildRoom(screenWidth, screenHeight, 0.65, 0.4, "J-156", pinColor),
                  buildRoom(screenWidth, screenHeight, 0.73, 0.4, "J-158", pinColor),
                  buildRoom(screenWidth, screenHeight, 0.82, 0.4, "J-160", pinColor),
                  buildRoom(screenWidth, screenHeight, 0.92, 0.4, "J-163", pinColor),
                  buildRoom(screenWidth, screenHeight, 0.92, 0.58, "J-165", pinColor),
                  buildRoom(screenWidth, screenHeight, 0.85, 0.58, "J-164", pinColor),
                  buildRoom(screenWidth, screenHeight, 0.78, 0.58, "J-161", pinColor),
                  buildRoom(screenWidth, screenHeight, 0.72, 0.58, "J-157", pinColor),
                  buildRoom(screenWidth, screenHeight, 0.69, 0.58, "J-159", pinColor),
                  buildRoom(screenWidth, screenHeight, 0.6, 0.58, "J-153", pinColor),
                  buildRoom(screenWidth, screenHeight, 0.37, 0.68, "J-101", pinColor),
                  buildRoom(screenWidth, screenHeight, 0.35, 0.55, "J-103", pinColor),
                  buildRoom(screenWidth, screenHeight, 0.31, 0.57, "J-106", pinColor),
                  buildRoom(screenWidth, screenHeight, 0.25, 0.57, "J-108", pinColor),
                  buildRoom(screenWidth, screenHeight, 0.20, 0.57, "J-110", pinColor),
                  buildRoom(screenWidth, screenHeight, 0.14, 0.57, "J-130", pinColor),
                  buildRoom(screenWidth, screenHeight, 0.1, 0.57, "J-132", pinColor),
                  buildRoom(screenWidth, screenHeight, 0.05, 0.57, "J-134", pinColor),

                  buildHall(screenWidth, screenHeight, 0.05, 0.53, 'H1', hallwayColor, route.contains('H1')),
                  buildHall(screenWidth, screenHeight, 0.1, 0.53, 'H2', hallwayColor, route.contains('H2')),
                  buildHall(screenWidth, screenHeight, 0.12, 0.53, 'H3', hallwayColor, route.contains('H3')),
                  buildHall(screenWidth, screenHeight, 0.14, 0.53, 'H4', hallwayColor, route.contains('H4')),
                  buildHall(screenWidth, screenHeight, 0.17, 0.53, 'H5', hallwayColor, route.contains('H5')),
                  buildHall(screenWidth, screenHeight, 0.19, 0.53, 'H6', hallwayColor, route.contains('H6')),
                  buildHall(screenWidth, screenHeight, 0.21, 0.53, 'H7', hallwayColor, route.contains('H7')),
                  buildHall(screenWidth, screenHeight, 0.25, 0.53, 'H8', hallwayColor, route.contains('H8')),
                  buildHall(screenWidth, screenHeight, 0.28, 0.53, 'H9', hallwayColor, route.contains('H9')),
                  buildHall(screenWidth, screenHeight, 0.30, 0.53, 'H10', hallwayColor, route.contains('H10')),
                  buildHall(screenWidth, screenHeight, 0.33, 0.53, 'H11', hallwayColor, route.contains('H11')),
                  buildHall(screenWidth, screenHeight, 0.36, 0.53, 'H12', hallwayColor, route.contains('H12')),
                  buildHall(screenWidth, screenHeight, 0.37, 0.53, 'H13', hallwayColor, route.contains('H13')),
                  buildHall(screenWidth, screenHeight, 0.37, 0.53, 'H14', hallwayColor, route.contains('H14')),
                  buildHall(screenWidth, screenHeight, 0.43, 0.53, 'H15', hallwayColor, route.contains('H15')),
                  buildHall(screenWidth, screenHeight, 0.43, 0.58, 'H16', hallwayColor, route.contains('H16')),
                  buildHall(screenWidth, screenHeight, 0.43, 0.63, 'H17', hallwayColor, route.contains('H17')),
                  buildHall(screenWidth, screenHeight, 0.43, 0.66, 'H18', hallwayColor, route.contains('H18')),
                  buildHall(screenWidth, screenHeight, 0.49, 0.66, 'H19', hallwayColor, route.contains('H19')),
                  buildHall(screenWidth, screenHeight, 0.545, 0.66, 'H20', hallwayColor, route.contains('H20')),
                  buildHall(screenWidth, screenHeight, 0.545, 0.62, 'H21', hallwayColor, route.contains('H21')),
                  buildHall(screenWidth, screenHeight, 0.545, 0.60, 'H22', hallwayColor, route.contains('H22')),
                  buildHall(screenWidth, screenHeight, 0.545, 0.53, 'H23', hallwayColor, route.contains('H23')),
                  buildHall(screenWidth, screenHeight, 0.57, 0.53, 'H24', hallwayColor, route.contains('H24')),
                  buildHall(screenWidth, screenHeight, 0.585, 0.53, 'H25', hallwayColor, route.contains('H25')),
                  buildHall(screenWidth, screenHeight, 0.61, 0.53, 'H26', hallwayColor, route.contains('H26')),
                  buildHall(screenWidth, screenHeight, 0.625, 0.53, 'H27', hallwayColor, route.contains('H27')),
                  buildHall(screenWidth, screenHeight, 0.67, 0.53, 'H28', hallwayColor, route.contains('H28')),
                  buildHall(screenWidth, screenHeight, 0.69, 0.53, 'H29', hallwayColor, route.contains('H29')),
                  buildHall(screenWidth, screenHeight, 0.70, 0.53, 'H30', hallwayColor, route.contains('H30')),
                  buildHall(screenWidth, screenHeight, 0.71, 0.53, 'H31', hallwayColor, route.contains('H31')),
                  buildHall(screenWidth, screenHeight, 0.75, 0.53, 'H32', hallwayColor, route.contains('H32')),
                  buildHall(screenWidth, screenHeight, 0.82, 0.53, 'H33', hallwayColor, route.contains('H33')),
                  buildHall(screenWidth, screenHeight, 0.835, 0.53, 'H34', hallwayColor, route.contains('H34')),
                  buildHall(screenWidth, screenHeight, 0.87, 0.53, 'H35', hallwayColor, route.contains('H35')),
                  buildHall(screenWidth, screenHeight, 0.88, 0.53, 'H36', hallwayColor, route.contains('H36')),
                  buildHall(screenWidth, screenHeight, 0.93, 0.53, 'H37', hallwayColor, route.contains('H37')),
                  buildHall(screenWidth, screenHeight, 0.95, 0.53, 'H38', hallwayColor, route.contains('H38')),
                  buildHall(screenWidth, screenHeight, 0.545, 0.42, 'H39', hallwayColor, route.contains('H39')),
                  buildHall(screenWidth, screenHeight, 0.49, 0.42, 'H40', hallwayColor, route.contains('H40')),
                  buildHall(screenWidth, screenHeight, 0.43, 0.42, 'H41', hallwayColor, route.contains('H41')),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Positioned buildRoom(
      double screenWidth, double screenHeight, double topPercent, double leftPercent, String label, Color color) {
    return Positioned(
      top: screenHeight * topPercent,
      left: screenWidth * leftPercent,
      key: Key(label),
      child: Row(
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          Icon(Icons.location_pin, color: color),
        ],
      ),
    );
  }

  Positioned buildHall(double screenWidth, double screenHeight, double topPercent, double leftPercent, String label, Color color, bool visible) {
    return Positioned(
      top: screenHeight * topPercent,
      left: screenWidth * leftPercent,
      key: Key(label),
      child: visible ? Icon(
        Icons.circle_rounded,
        color: color,
        size: textSize / 3,
      ): SizedBox.shrink(),
    );
  }
}
