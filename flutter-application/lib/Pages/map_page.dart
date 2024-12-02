import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_navigation_app/Utilities/map.dart';
import 'package:my_navigation_app/Utilities/qrscan.dart';

class MapPage extends StatefulWidget {
  final double textSize;
  final String? currentLocation;
  final String? destination;
  final bool darkMode;
  const MapPage(
      {super.key,
      required this.textSize,
      this.currentLocation,
      this.destination,
      required this.darkMode});

  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  late String? destination;
  late String? currentLocation;
  final TextEditingController currloca = TextEditingController();
  final TextEditingController dest = TextEditingController();
  List<String> suggestions = [
    'J-135',
    'J-133',
    'J-131',
    'J-120',
    'J-109',
    'J-107',
    'J-105',
    'Stacks',
    'J-152',
    'J-151',
    'J-156',
    'J-158',
    'J-160',
    'J-163',
    'J-165',
    'J-164',
    'J-161',
    'J-157',
    'J-159',
    'J-153',
    'J-101',
    'J-103',
    'J-106',
    'J-108',
    'J-110',
    'J-130',
    'J-132',
    'J-134'
  ];

  get darkMode => widget.darkMode;

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
    FocusScope.of(context).unfocus();
    setState(() {
      currentLocation = newLocation;
      destination = newDestination;
    });
  }

  void setresult(String result) {
    currloca.text = result;
  }

  @override
  Widget build(BuildContext context) {
    final pinColor = Colors.blue;
    final hallwayColor = Colors.amber;
    List<dynamic> route = [];
    if (currentLocation!.isNotEmpty && destination!.isNotEmpty) {
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
                suffixIcon: IconButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            QrCodeScanner(setresult: setresult)),
                  ),
                  icon: Icon(Icons.qr_code),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text.isEmpty) {
                  return const Iterable<String>.empty();
                }
                return suggestions.where((String option) {
                  return option
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase());
                });
              },
              onSelected: (String selection) {
                dest.text = selection;
              },
              fieldViewBuilder: (BuildContext context,
                  TextEditingController textEditingController,
                  FocusNode focusNode,
                  VoidCallback onFieldSubmitted) {
                textEditingController.addListener(() {
                  if (textEditingController.text.toLowerCase() == 'j' &&
                      textEditingController.text.length == 1) {
                    textEditingController.value =
                        textEditingController.value.copyWith(
                      text: 'J-',
                      selection: TextSelection.collapsed(offset: 2),
                    );
                  } else if (textEditingController.text.toLowerCase() ==
                      'stacks') {
                    textEditingController.value =
                        textEditingController.value.copyWith(
                      text: 'Stacks',
                      selection:
                          TextSelection.collapsed(offset: 'Stacks'.length),
                    );
                  }
                });
                return TextField(
                  controller: textEditingController,
                  focusNode: focusNode,
                  decoration: InputDecoration(
                    labelText: destination ?? 'Enter Destination',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (String value) {
                    // Allow users to delete autofilled text if they want
                    if (value.isEmpty) {
                      textEditingController.clear();
                    }
                  },
                );
              },
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
                              darkMode
                                  ? 'assets/images/mock_app_no_bg_dark_mode.svg'
                                  : 'assets/images/mock_app_no_bg.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                          ..._buildRooms(screenWidth, screenHeight, pinColor),
                          ..._buildHalls(
                              screenWidth, screenHeight, hallwayColor, route),
                          if (route.isNotEmpty)
                            buildPolyline(
                                screenWidth,
                                screenHeight,
                                route,
                                _buildHalls(screenWidth, screenHeight,
                                    hallwayColor, route)),
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

  List<Widget> _buildRooms(
      double screenWidth, double screenHeight, Color pinColor) {
    return [
      buildRoom(screenWidth, screenHeight, 0.05, 0.45, "J-135", pinColor),
      buildRoom(screenWidth, screenHeight, 0.1, 0.45, "J-133", pinColor),
      buildRoom(screenWidth, screenHeight, 0.14, 0.45, "J-131", pinColor),
      buildRoom(screenWidth, screenHeight, 0.201, 0.45, "J-120", pinColor),
      buildRoom(screenWidth, screenHeight, 0.27, 0.45, "J-109", pinColor),
      buildRoom(screenWidth, screenHeight, 0.32, 0.45, "J-107", pinColor),
      buildRoom(screenWidth, screenHeight, 0.37, 0.45, "J-105", pinColor),
      buildRoom(screenWidth, screenHeight, 0.39, 0.4, "Stacks", pinColor),
      buildRoom(screenWidth, screenHeight, 0.57, 0.4, "J-152", pinColor),
      buildRoom(screenWidth, screenHeight, 0.57, 0.617, "J-151", pinColor),
      buildRoom(screenWidth, screenHeight, 0.65, 0.45, "J-156", pinColor),
      buildRoom(screenWidth, screenHeight, 0.73, 0.45, "J-158", pinColor),
      buildRoom(screenWidth, screenHeight, 0.82, 0.45, "J-160", pinColor),
      buildRoom(screenWidth, screenHeight, 0.92, 0.45, "J-163", pinColor),
      buildRoom(screenWidth, screenHeight, 0.92, 0.56, "J-165", pinColor),
      buildRoom(screenWidth, screenHeight, 0.86, 0.55, "J-164", pinColor),
      buildRoom(screenWidth, screenHeight, 0.78, 0.55, "J-161", pinColor),
      buildRoom(screenWidth, screenHeight, 0.70, 0.55, "J-157", pinColor),
      buildRoom(screenWidth, screenHeight, 0.64, 0.55, "J-159", pinColor),
      buildRoom(screenWidth, screenHeight, 0.6, 0.55, "J-153", pinColor),
      buildRoom(screenWidth, screenHeight, 0.39, 0.61, "J-101", pinColor),
      buildRoom(screenWidth, screenHeight, 0.36, 0.545, "J-103", pinColor),
      buildRoom(screenWidth, screenHeight, 0.31, 0.545, "J-106", pinColor),
      buildRoom(screenWidth, screenHeight, 0.27, 0.545, "J-108", pinColor),
      buildRoom(screenWidth, screenHeight, 0.20, 0.545, "J-110", pinColor),
      buildRoom(screenWidth, screenHeight, 0.14, 0.545, "J-130", pinColor),
      buildRoom(screenWidth, screenHeight, 0.1, 0.545, "J-132", pinColor),
      buildRoom(screenWidth, screenHeight, 0.05, 0.545, "J-134", pinColor),
    ];
  }

  List<Positioned> _buildHalls(double screenWidth, double screenHeight,
      Color hallwayColor, List<dynamic> route) {
    return [
      buildHall(screenWidth, screenHeight, 0.05, 0.52, 'H1', hallwayColor,
          route.contains('H1')),
      buildHall(screenWidth, screenHeight, 0.1, 0.52, 'H2', hallwayColor,
          route.contains('H2')),
      buildHall(screenWidth, screenHeight, 0.12, 0.52, 'H3', hallwayColor,
          route.contains('H3')),
      buildHall(screenWidth, screenHeight, 0.14, 0.52, 'H4', hallwayColor,
          route.contains('H4')),
      buildHall(screenWidth, screenHeight, 0.17, 0.52, 'H5', hallwayColor,
          route.contains('H5')),
      buildHall(screenWidth, screenHeight, 0.19, 0.52, 'H6', hallwayColor,
          route.contains('H6')),
      buildHall(screenWidth, screenHeight, 0.21, 0.52, 'H7', hallwayColor,
          route.contains('H7')),
      buildHall(screenWidth, screenHeight, 0.25, 0.52, 'H8', hallwayColor,
          route.contains('H8')),
      buildHall(screenWidth, screenHeight, 0.28, 0.52, 'H9', hallwayColor,
          route.contains('H9')),
      buildHall(screenWidth, screenHeight, 0.30, 0.52, 'H10', hallwayColor,
          route.contains('H10')),
      buildHall(screenWidth, screenHeight, 0.33, 0.52, 'H11', hallwayColor,
          route.contains('H11')),
      buildHall(screenWidth, screenHeight, 0.36, 0.52, 'H12', hallwayColor,
          route.contains('H12')),
      buildHall(screenWidth, screenHeight, 0.37, 0.52, 'H13', hallwayColor,
          route.contains('H13')),
      buildHall(screenWidth, screenHeight, 0.37, 0.52, 'H14', hallwayColor,
          route.contains('H14')),
      buildHall(screenWidth, screenHeight, 0.43, 0.52, 'H15', hallwayColor,
          route.contains('H15')),
      buildHall(screenWidth, screenHeight, 0.43, 0.54, 'H16', hallwayColor,
          route.contains('H16')),
      buildHall(screenWidth, screenHeight, 0.43, 0.58, 'H17', hallwayColor,
          route.contains('H17')),
      buildHall(screenWidth, screenHeight, 0.43, 0.6, 'H18', hallwayColor,
          route.contains('H18')),
      buildHall(screenWidth, screenHeight, 0.49, 0.60, 'H19', hallwayColor,
          route.contains('H19')),
      buildHall(screenWidth, screenHeight, 0.545, 0.6, 'H20', hallwayColor,
          route.contains('H20')),
      buildHall(screenWidth, screenHeight, 0.545, 0.57, 'H21', hallwayColor,
          route.contains('H21')),
      buildHall(screenWidth, screenHeight, 0.545, 0.555, 'H22', hallwayColor,
          route.contains('H22')),
      buildHall(screenWidth, screenHeight, 0.545, 0.52, 'H23', hallwayColor,
          route.contains('H23')),
      buildHall(screenWidth, screenHeight, 0.58, 0.52, 'H24', hallwayColor,
          route.contains('H24')),
      buildHall(screenWidth, screenHeight, 0.6, 0.52, 'H25', hallwayColor,
          route.contains('H25')),
      buildHall(screenWidth, screenHeight, 0.61, 0.52, 'H26', hallwayColor,
          route.contains('H26')),
      buildHall(screenWidth, screenHeight, 0.625, 0.52, 'H27', hallwayColor,
          route.contains('H27')),
      buildHall(screenWidth, screenHeight, 0.67, 0.52, 'H28', hallwayColor,
          route.contains('H28')),
      buildHall(screenWidth, screenHeight, 0.69, 0.52, 'H29', hallwayColor,
          route.contains('H29')),
      buildHall(screenWidth, screenHeight, 0.70, 0.52, 'H30', hallwayColor,
          route.contains('H30')),
      buildHall(screenWidth, screenHeight, 0.71, 0.52, 'H31', hallwayColor,
          route.contains('H31')),
      buildHall(screenWidth, screenHeight, 0.75, 0.52, 'H32', hallwayColor,
          route.contains('H32')),
      buildHall(screenWidth, screenHeight, 0.82, 0.52, 'H33', hallwayColor,
          route.contains('H33')),
      buildHall(screenWidth, screenHeight, 0.835, 0.52, 'H34', hallwayColor,
          route.contains('H34')),
      buildHall(screenWidth, screenHeight, 0.87, 0.52, 'H35', hallwayColor,
          route.contains('H35')),
      buildHall(screenWidth, screenHeight, 0.88, 0.52, 'H36', hallwayColor,
          route.contains('H36')),
      buildHall(screenWidth, screenHeight, 0.93, 0.52, 'H37', hallwayColor,
          route.contains('H37')),
      buildHall(screenWidth, screenHeight, 0.95, 0.52, 'H38', hallwayColor,
          route.contains('H38')),
      buildHall(screenWidth, screenHeight, 0.545, 0.445, 'H39', hallwayColor,
          route.contains('H39')),
      buildHall(screenWidth, screenHeight, 0.49, 0.45, 'H40', hallwayColor,
          route.contains('H40')),
      buildHall(screenWidth, screenHeight, 0.43, 0.445, 'H41', hallwayColor,
          route.contains('H41')),
    ];
  }

  Widget buildPolyline(double screenWidth, double screenHeight,
      List<dynamic> route, List<Positioned> hallways) {
    List<Offset> points = [];
    for (String node in route) {
      Positioned? p = hallways
          .where((element) => element.key == Key(node))
          .take(1)
          .cast<Positioned>()
          .singleOrNull;
      if (p != null) {
        points.add(Offset(p.left!, p.top!));
      }
    }
    return CustomPaint(
      painter: PolylinePainter(points),
      child: Stack(children: [
        Positioned(
          top: points[0].dy - 2,
          left: points[0].dx - 6,
          child: Icon(
            Icons.circle_rounded,
            color: Colors.blue,
            size: 12,
          ),
        ),
        Positioned(
          top: points[points.length - 1].dy - 2,
          left: points[points.length - 1].dx - 6,
          child: Icon(
            Icons.circle_rounded,
            color: Colors.blue,
            size: 12,
          ),
        ),
      ]),
    );
  }

  Positioned buildRoom(double screenWidth, double screenHeight,
      double topPercent, double leftPercent, String label, Color color) {
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

  Positioned buildHall(
      double screenWidth,
      double screenHeight,
      double topPercent,
      double leftPercent,
      String label,
      Color color,
      bool visible) {
    return Positioned(
      top: screenHeight * topPercent,
      left: screenWidth * leftPercent,
      key: Key(label),
      child: SizedBox.shrink(),
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
