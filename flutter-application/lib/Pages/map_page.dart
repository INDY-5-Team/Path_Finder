import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_navigation_app/Utilities/map.dart';

class MapPage extends StatefulWidget {
  final double textSize;
  final String? currentLocation;
  final String? destination;
  const MapPage({super.key, required this.textSize, this.currentLocation, this.destination});

  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
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

  void update(String newLocation, String newDestination) {
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
    if (currloca.text.isNotEmpty && dest.text.isNotEmpty) {
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
                boundaryMargin: const EdgeInsets.all(100),
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
    List<Map<String, dynamic>> rooms = [
      {'topPercent': 0.05, 'leftPercent': 0.40909, 'label': 'J-135'},
      {'topPercent': 0.1, 'leftPercent': 0.409, 'label': 'J-133'},
      {'topPercent': 0.14, 'leftPercent': 0.409, 'label': 'J-131'},
      {'topPercent': 0.201, 'leftPercent': 0.409, 'label': 'J-120'},
      {'topPercent': 0.27, 'leftPercent': 0.409, 'label': 'J-109'},
      {'topPercent': 0.32, 'leftPercent': 0.409, 'label': 'J-107'},
      {'topPercent': 0.37, 'leftPercent': 0.38, 'label': 'J-105'},
      {'topPercent': 0.39, 'leftPercent': 0.3, 'label': 'Stacks'},
      {'topPercent': 0.58, 'leftPercent': 0.35, 'label': 'J-152'},
      {'topPercent': 0.58, 'leftPercent': 0.60, 'label': 'J-151'},
      {'topPercent': 0.65, 'leftPercent': 0.409, 'label': 'J-156'},
      {'topPercent': 0.73, 'leftPercent': 0.409, 'label': 'J-158'},
      {'topPercent': 0.82, 'leftPercent': 0.409, 'label': 'J-160'},
      {'topPercent': 0.92, 'leftPercent': 0.409, 'label': 'J-163'},
      {'topPercent': 0.92, 'leftPercent': 0.53, 'label': 'J-165'},
      {'topPercent': 0.85, 'leftPercent': 0.53, 'label': 'J-164'},
      {'topPercent': 0.78, 'leftPercent': 0.53, 'label': 'J-161'},
      {'topPercent': 0.70, 'leftPercent': 0.53, 'label': 'J-157'},
      {'topPercent': 0.64, 'leftPercent': 0.53, 'label': 'J-159'},
      {'topPercent': 0.6, 'leftPercent': 0.55, 'label': 'J-153'},
      {'topPercent': 0.37, 'leftPercent': 0.60, 'label': 'J-101'},
      {'topPercent': 0.35, 'leftPercent': 0.52, 'label': 'J-103'},
      {'topPercent': 0.31, 'leftPercent': 0.53, 'label': 'J-106'},
      {'topPercent': 0.25, 'leftPercent': 0.53, 'label': 'J-108'},
      {'topPercent': 0.20, 'leftPercent': 0.53, 'label': 'J-110'},
      {'topPercent': 0.14, 'leftPercent': 0.53, 'label': 'J-130'},
      {'topPercent': 0.1, 'leftPercent': 0.53, 'label': 'J-132'},
      {'topPercent': 0.05, 'leftPercent': 0.53, 'label': 'J-134'},
    ];
    return rooms.map((room) => buildRoom(screenWidth, screenHeight, room['topPercent'], room['leftPercent'], room['label'], pinColor)).toList();
  }

  List<Widget> _buildHalls(double screenWidth, double screenHeight, Color hallwayColor, List<dynamic> route) {
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
    return hallPositions.map((hall) => buildHall(screenWidth, screenHeight, hall['topPercent'], hall['leftPercent'], hall['label'], hallwayColor, route.contains(hall['label']))).toList();
  }

  Widget buildPolyline(double screenWidth, double screenHeight, List<dynamic> route) {
    List<Map<String, dynamic>> hallPositions = [
      {'label': 'H1', 'offset': Offset(screenWidth * 0.53, screenHeight * 0.05)},
      {'label': 'H2', 'offset': Offset(screenWidth * 0.53, screenHeight * 0.1)},
      {'label': 'H3', 'offset': Offset(screenWidth * 0.53, screenHeight * 0.12)},
      {'label': 'H4', 'offset': Offset(screenWidth * 0.53, screenHeight * 0.14)},
      {'label': 'H5', 'offset': Offset(screenWidth * 0.53, screenHeight * 0.17)},
      {'label': 'H6', 'offset': Offset(screenWidth * 0.53, screenHeight * 0.19)},
      {'label': 'H7', 'offset': Offset(screenWidth * 0.53, screenHeight * 0.21)},
      {'label': 'H8', 'offset': Offset(screenWidth * 0.53, screenHeight * 0.25)},
      {'label': 'H9', 'offset': Offset(screenWidth * 0.53, screenHeight * 0.28)},
      {'label': 'H10', 'offset': Offset(screenWidth * 0.53, screenHeight * 0.30)},
      {'label': 'H11', 'offset': Offset(screenWidth * 0.53, screenHeight * 0.33)},
      {'label': 'H12', 'offset': Offset(screenWidth * 0.53, screenHeight * 0.36)},
      {'label': 'H13', 'offset': Offset(screenWidth * 0.53, screenHeight * 0.37)},
      {'label': 'H14', 'offset': Offset(screenWidth * 0.53, screenHeight * 0.37)},
      {'label': 'H15', 'offset': Offset(screenWidth * 0.53, screenHeight * 0.4093)},
      {'label': 'H16', 'offset': Offset(screenWidth * 0.53, screenHeight * 0.4093)},
      {'label': 'H17', 'offset': Offset(screenWidth * 0.63, screenHeight * 0.4093)},
      {'label': 'H18', 'offset': Offset(screenWidth * 0.66, screenHeight * 0.4093)},
      {'label': 'H19', 'offset': Offset(screenWidth * 0.66, screenHeight * 0.4099)},
      {'label': 'H20', 'offset': Offset(screenWidth * 0.66, screenHeight * 0.545)},
      {'label': 'H21', 'offset': Offset(screenWidth * 0.62, screenHeight * 0.545)},
      {'label': 'H22', 'offset': Offset(screenWidth * 0.60, screenHeight * 0.545)},
      {'label': 'H23', 'offset': Offset(screenWidth * 0.53, screenHeight * 0.545)},
      {'label': 'H24', 'offset': Offset(screenWidth * 0.53, screenHeight * 0.53)},
      {'label': 'H25', 'offset': Offset(screenWidth * 0.53, screenHeight * 0.535)},
      {'label': 'H26', 'offset': Offset(screenWidth * 0.53, screenHeight * 0.61)},
      {'label': 'H27', 'offset': Offset(screenWidth * 0.53, screenHeight * 0.625)},
      {'label': 'H28', 'offset': Offset(screenWidth * 0.53, screenHeight * 0.67)},
      {'label': 'H29', 'offset': Offset(screenWidth * 0.53, screenHeight * 0.69)},
      {'label': 'H30', 'offset': Offset(screenWidth * 0.53, screenHeight * 0.70)},
      {'label': 'H31', 'offset': Offset(screenWidth * 0.53, screenHeight * 0.71)},
      {'label': 'H32', 'offset': Offset(screenWidth * 0.53, screenHeight * 0.75)},
      {'label': 'H33', 'offset': Offset(screenWidth * 0.53, screenHeight * 0.82)},
      {'label': 'H34', 'offset': Offset(screenWidth * 0.53, screenHeight * 0.835)},
      {'label': 'H35', 'offset': Offset(screenWidth * 0.53, screenHeight * 0.87)},
      {'label': 'H36', 'offset': Offset(screenWidth * 0.53, screenHeight * 0.88)},
      {'label': 'H37', 'offset': Offset(screenWidth * 0.53, screenHeight * 0.93)},
      {'label': 'H38', 'offset': Offset(screenWidth * 0.53, screenHeight * 0.95)},
      {'label': 'H39', 'offset': Offset(screenWidth * 0.4092, screenHeight * 0.545)},
      {'label': 'H40', 'offset': Offset(screenWidth * 0.4092, screenHeight * 0.4099)},
      {'label': 'H41', 'offset': Offset(screenWidth * 0.4092, screenHeight * 0.4093)},
    ];

    List<Offset> points = route.map((node) {
      final hall = hallPositions.firstWhere((hall) => hall['label'] == node, orElse: () => {'offset': Offset.zero});
      return hall['offset'] as Offset;
    }).where((offset) => offset != Offset.zero).toList();

    return CustomPaint(
      painter: PolylinePainter(points),
    );
  }

  Positioned buildRoom(double screenWidth, double screenHeight, double topPercent, double leftPercent, String label, Color color) {
    return Positioned(
      top: screenHeight * topPercent,
      left: screenWidth * leftPercent,
      key: Key(label),
      child: Row(
        children: <Widget>[
          if (leftPercent < 0.5)
            Text(
              label,
              style: const TextStyle(
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
          if (leftPercent >= 0.5)
            Text(
              label,
              style: const TextStyle(
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
      child: visible
          ? Icon(
              Icons.circle_rounded,
              color: color,
              size: widget.textSize / 3,
            )
          : const SizedBox.shrink(),
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
