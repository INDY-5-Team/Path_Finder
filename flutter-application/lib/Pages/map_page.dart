import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_navigation_app/Utilities/map.dart';
import 'dart:ui';

class MapPage extends StatefulWidget {
  final double textSize;
  final String? currentLocation;
  final String? destination;  
  const MapPage({super.key, required this.textSize, this.currentLocation, this.destination});

  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {  
  get textSize => super.widget.textSize;

  late String? destination;
  late String? currentLocation;
  final TextEditingController currloca = TextEditingController();
  final TextEditingController dest = TextEditingController();

  @override
  void initState() {
    super.initState();
    destination = widget.destination;
    currentLocation = widget.currentLocation;
  }
  
  void updateDestination(String newDestination) {    
    dest.text = newDestination;
  }

  void update(newLocation, newDestination) {
    setState(() {
      currentLocation = newLocation;
      destination = newDestination;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pinColor = Colors.blue;
    final hallwayColor = Colors.amber;    

    List<dynamic> route = [];
    if(currloca.text.isNotEmpty && dest.text.isNotEmpty){
      Graph graph = Graph();
      graph.loadFromJson('assets/maps/atrium_f1.json', context);
      route = graph.route(currloca.text, dest.text);
    }
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: currloca,
              decoration: InputDecoration(
                labelText: currentLocation ?? 'Current Location',
                border: OutlineInputBorder(),                
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: dest,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: destination ?? 'Enter Destination',
              ),
            ),
            const SizedBox(height: 16),
            FloatingActionButton(
              onPressed: () => update(currloca.text, dest.text),
              backgroundColor: Colors.blue,
              child: const Icon(Icons.search),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: InteractiveViewer(
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
                          ..._buildRooms(screenWidth, screenHeight, pinColor),
                          ..._buildHalls(screenWidth, screenHeight, hallwayColor, route),
                          if (route.isNotEmpty) buildPolyline(screenWidth, screenHeight, route),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildRooms(double screenWidth, double screenHeight, Color pinColor) {
    return [
      buildRoom(screenWidth, screenHeight, 0.05, 0.40909, "J-135", pinColor),
      buildRoom(screenWidth, screenHeight, 0.1, 0.409, "J-133", pinColor),
      buildRoom(screenWidth, screenHeight, 0.14, 0.409, "J-131", pinColor),
      buildRoom(screenWidth, screenHeight, 0.201, 0.409, "J-120", pinColor),
      buildRoom(screenWidth, screenHeight, 0.27, 0.409, "J-109", pinColor),
      buildRoom(screenWidth, screenHeight, 0.32, 0.409, "J-107", pinColor),
      buildRoom(screenWidth, screenHeight, 0.37, 0.38, "J-105", pinColor),
      buildRoom(screenWidth, screenHeight, 0.39, 0.3, "Stacks", pinColor),
      buildRoom(screenWidth, screenHeight, 0.58, 0.35, "J-152", pinColor),
      buildRoom(screenWidth, screenHeight, 0.58, 0.60, "J-151", pinColor),
      buildRoom(screenWidth, screenHeight, 0.65, 0.409, "J-156", pinColor),
      buildRoom(screenWidth, screenHeight, 0.73, 0.409, "J-158", pinColor),
      buildRoom(screenWidth, screenHeight, 0.82, 0.409, "J-160", pinColor),
      buildRoom(screenWidth, screenHeight, 0.92, 0.409, "J-163", pinColor),
      buildRoom(screenWidth, screenHeight, 0.92, 0.53, "J-165", pinColor),
      buildRoom(screenWidth, screenHeight, 0.85, 0.53, "J-164", pinColor),
      buildRoom(screenWidth, screenHeight, 0.78, 0.53, "J-161", pinColor),
      buildRoom(screenWidth, screenHeight, 0.70, 0.53, "J-157", pinColor),
      buildRoom(screenWidth, screenHeight, 0.64, 0.53, "J-159", pinColor),
      buildRoom(screenWidth, screenHeight, 0.6, 0.55, "J-153", pinColor),
      buildRoom(screenWidth, screenHeight, 0.37, 0.60, "J-101", pinColor),
      buildRoom(screenWidth, screenHeight, 0.35, 0.52, "J-103", pinColor),
      buildRoom(screenWidth, screenHeight, 0.31, 0.53, "J-106", pinColor),
      buildRoom(screenWidth, screenHeight, 0.25, 0.53, "J-108", pinColor),
      buildRoom(screenWidth, screenHeight, 0.20, 0.53, "J-110", pinColor),
      buildRoom(screenWidth, screenHeight, 0.14, 0.53, "J-130", pinColor),
      buildRoom(screenWidth, screenHeight, 0.1, 0.53, "J-132", pinColor),
      buildRoom(screenWidth, screenHeight, 0.05, 0.53, "J-134", pinColor),
    ];
  }

  List<Widget> _buildHalls(double screenWidth, double screenHeight, Color hallwayColor, List<dynamic> route) {
    List<Widget> halls = [];
    List<Map<String, dynamic>> hallPositions = [
      {'topPercent': 0.05, 'leftPercent': 0.53, 'label': 'H1'},
      {'topPercent': 0.1, 'leftPercent': 0.53, 'label': 'H2'},
      {'topPercent': 0.12, 'leftPercent': 0.53, 'label': 'H3'},
      {'topPercent': 0.14, 'leftPercent': 0.53, 'label': 'H4'},
      {'topPercent': 0.17, 'leftPercent': 0.53, 'label': 'H5'},
      {'topPercent': 0.19, 'leftPercent': 0.53, 'label': 'H6'},
      {'topPercent': 0.21, 'leftPercent': 0.53, 'label': 'H7'},
      {'topPercent': 0.25, 'leftPercent': 0.53, 'label': 'H8'},
      {'topPercent': 0.28, 'leftPercent': 0.53, 'label': 'H9'},
      {'topPercent': 0.30, 'leftPercent': 0.53, 'label': 'H10'},
      {'topPercent': 0.33, 'leftPercent': 0.53, 'label': 'H11'},
      {'topPercent': 0.36, 'leftPercent': 0.53, 'label': 'H12'},
      {'topPercent': 0.37, 'leftPercent': 0.53, 'label': 'H13'},
      {'topPercent': 0.37, 'leftPercent': 0.53, 'label': 'H14'},
      {'topPercent': 0.4093, 'leftPercent': 0.53, 'label': 'H15'},
      {'topPercent': 0.4093, 'leftPercent': 0.53, 'label': 'H16'},
      {'topPercent': 0.4093, 'leftPercent': 0.63, 'label': 'H17'},
      {'topPercent': 0.4093, 'leftPercent': 0.66, 'label': 'H18'},
      {'topPercent': 0.4099, 'leftPercent': 0.66, 'label': 'H19'},
      {'topPercent': 0.545, 'leftPercent': 0.66, 'label': 'H20'},
      {'topPercent': 0.545, 'leftPercent': 0.62, 'label': 'H21'},
      {'topPercent': 0.545, 'leftPercent': 0.60, 'label': 'H22'},
      {'topPercent': 0.545, 'leftPercent': 0.53, 'label': 'H23'},
      {'topPercent': 0.53, 'leftPercent': 0.53, 'label': 'H24'},
      {'topPercent': 0.535, 'leftPercent': 0.53, 'label': 'H25'},
      {'topPercent': 0.61, 'leftPercent': 0.53, 'label': 'H26'},
      {'topPercent': 0.625, 'leftPercent': 0.53, 'label': 'H27'},
      {'topPercent': 0.67, 'leftPercent': 0.53, 'label': 'H28'},
      {'topPercent': 0.69, 'leftPercent': 0.53, 'label': 'H29'},
      {'topPercent': 0.70, 'leftPercent': 0.53, 'label': 'H30'},
      {'topPercent': 0.71, 'leftPercent': 0.53, 'label': 'H31'},
      {'topPercent': 0.75, 'leftPercent': 0.53, 'label': 'H32'},
      {'topPercent': 0.82, 'leftPercent': 0.53, 'label': 'H33'},
      {'topPercent': 0.835, 'leftPercent': 0.53, 'label': 'H34'},
      {'topPercent': 0.87, 'leftPercent': 0.53, 'label': 'H35'},
      {'topPercent': 0.88, 'leftPercent': 0.53, 'label': 'H36'},
      {'topPercent': 0.93, 'leftPercent': 0.53, 'label': 'H37'},
      {'topPercent': 0.95, 'leftPercent': 0.53, 'label': 'H38'},
      {'topPercent': 0.545, 'leftPercent': 0.4092, 'label': 'H39'},
      {'topPercent': 0.4099, 'leftPercent': 0.4092, 'label': 'H40'},
      {'topPercent': 0.4093, 'leftPercent': 0.4092, 'label': 'H41'},
    ];
    for (var hall in hallPositions) {
      halls.add(buildHall(screenWidth, screenHeight, hall['topPercent'], hall['leftPercent'], hall['label'], hallwayColor, route.contains(hall['label'])));
    }
    return halls;
  }

  Widget buildPolyline(double screenWidth, double screenHeight, List<dynamic> route) {
    List<Offset> points = route.map((node) {
      switch (node) {
        case 'H1':
          return Offset(screenWidth * 0.53, screenHeight * 0.05);
        case 'H2':
          return Offset(screenWidth * 0.53, screenHeight * 0.1);
        case 'H3':
          return Offset(screenWidth * 0.53, screenHeight * 0.12);
        case 'H4':
          return Offset(screenWidth * 0.53, screenHeight * 0.14);
        case 'H5':
          return Offset(screenWidth * 0.53, screenHeight * 0.17);
        case 'H6':
          return Offset(screenWidth * 0.53, screenHeight * 0.19);
        case 'H7':
          return Offset(screenWidth * 0.53, screenHeight * 0.21);
        case 'H8':
          return Offset(screenWidth * 0.53, screenHeight * 0.25);
        case 'H9':
          return Offset(screenWidth * 0.53, screenHeight * 0.28);
        case 'H10':
          return Offset(screenWidth * 0.53, screenHeight * 0.30);
        case 'H11':
          return Offset(screenWidth * 0.53, screenHeight * 0.33);
        case 'H12':
          return Offset(screenWidth * 0.53, screenHeight * 0.36);
        case 'H13':
          return Offset(screenWidth * 0.53, screenHeight * 0.37);
        case 'H14':
          return Offset(screenWidth * 0.53, screenHeight * 0.37);
        case 'H15':
          return Offset(screenWidth * 0.53, screenHeight * 0.4093);
        case 'H16':
          return Offset(screenWidth * 0.53, screenHeight * 0.4093);
        case 'H17':
          return Offset(screenWidth * 0.63, screenHeight * 0.4093);
        case 'H18':
          return Offset(screenWidth * 0.66, screenHeight * 0.4093);
        case 'H19':
          return Offset(screenWidth * 0.66, screenHeight * 0.4099);
        case 'H20':
          return Offset(screenWidth * 0.66, screenHeight * 0.545);
        case 'H21':
          return Offset(screenWidth * 0.62, screenHeight * 0.545);
        case 'H22':
          return Offset(screenWidth * 0.60, screenHeight * 0.545);
        case 'H23':
          return Offset(screenWidth * 0.53, screenHeight * 0.545);
        case 'H24':
          return Offset(screenWidth * 0.53, screenHeight * 0.53);
        case 'H25':
          return Offset(screenWidth * 0.53, screenHeight * 0.535);
        case 'H26':
          return Offset(screenWidth * 0.53, screenHeight * 0.61);
        case 'H27':
          return Offset(screenWidth * 0.53, screenHeight * 0.625);
        case 'H28':
          return Offset(screenWidth * 0.53, screenHeight * 0.67);
        case 'H29':
          return Offset(screenWidth * 0.53, screenHeight * 0.69);
        case 'H30':
          return Offset(screenWidth * 0.53, screenHeight * 0.70);
        case 'H31':
          return Offset(screenWidth * 0.53, screenHeight * 0.71);
        case 'H32':
          return Offset(screenWidth * 0.53, screenHeight * 0.75);
        case 'H33':
          return Offset(screenWidth * 0.53, screenHeight * 0.82);
        case 'H34':
          return Offset(screenWidth * 0.53, screenHeight * 0.835);
        case 'H35':
          return Offset(screenWidth * 0.53, screenHeight * 0.87);
        case 'H36':
          return Offset(screenWidth * 0.53, screenHeight * 0.88);
        case 'H37':
          return Offset(screenWidth * 0.53, screenHeight * 0.93);
        case 'H38':
          return Offset(screenWidth * 0.53, screenHeight * 0.95);
        case 'H39':
          return Offset(screenWidth * 0.4092, screenHeight * 0.545);
        case 'H40':
          return Offset(screenWidth * 0.4092, screenHeight * 0.4099);
        case 'H41':
          return Offset(screenWidth * 0.4092, screenHeight * 0.4093);
        default:
          return Offset(0, 0);
      }
    }).toList();

    return CustomPaint(
      painter: PolylinePainter(points),
    );
  }

  Positioned buildRoom(
      double screenWidth, double screenHeight, double topPercent, double leftPercent, String label, Color color) {
    return Positioned(
      top: screenHeight * topPercent,
      left: screenWidth * leftPercent,
      key: Key(label),
      child: leftPercent < 0.5
        ? Row(
            children: <Widget>[
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.blue,
                ),
              ),
              GestureDetector(
                onTap: () {
                  updateDestination(label);
                },
                child: Icon(
                  Icons.location_pin,
                  color: color,
                  size: 12,
                ),
              ),
            ],
          )
        : Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  updateDestination(label);
                },
                child: Icon(
                  Icons.location_pin,
                  color: color,
                  size: 12,
                ),
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.blue,
                ),
              ),
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

class PolylinePainter extends CustomPainter {
  final List<Offset> points;

  PolylinePainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke;

    if (points.length > 1) {
      for (int i = 0; i < points.length - 1; i++) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
