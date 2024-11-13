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
        boundaryMargin: EdgeInsets.all(100),
        minScale: 0.5,
        maxScale: 4.0,
        child: Center(
          child: Stack(
            children: [
              SizedBox(
              width: screenSize.width * 2,
              height: screenSize.height * 2,
              child: SvgPicture.asset(
                'assets/images/mock_app_no_bg.svg',
                fit: BoxFit.none,
            ),
          ),
          Positioned(
            top: 40, left: 180,
            key: Key('J-135'),
            child: Row(
                children: <Widget>[                  
                  Text(
                    "J-135",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,                      
                    )),
                  Icon(Icons.location_pin, color: Colors.blue),
                ]),                          
          ),
          Positioned(
            top: 80, left: 180,
            key: Key('J-133'),
            child: Row(
                children: <Widget>[                  
                  Text(
                    "J-133",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,                      
                    )),
                  Icon(Icons.location_pin, color: Colors.blue),
                ]),                          
          ),
          Positioned(
            top: 120, left: 180,
            key: Key('J-131'),
            child: Row(
                children: <Widget>[                  
                  Text(
                    "J-131",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,                      
                    )),
                  Icon(Icons.location_pin, color: Colors.blue),
                ]),                          
          ),
          Positioned(
            top: 168, left: 180,
            key: Key('J-120'),
            child: Row(
                children: <Widget>[                  
                  Text(
                    "J-120",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,                      
                    )),
                  Icon(Icons.location_pin, color: Colors.blue),
                ]),                          
          ),
          Positioned(
            top: 216, left: 180,
            key: Key('J-109'),
            child: Row(
                children: <Widget>[                  
                  Text(
                    "J-109",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,                      
                    )),
                  Icon(Icons.location_pin, color: Colors.blue),
                ]),                          
          ),
          Positioned(
            top: 260, left: 180,
            key: Key('J-107'),
            child: Row(
                children: <Widget>[                  
                  Text(
                    "J-107",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,                      
                    )),
                  Icon(Icons.location_pin, color: Colors.blue),
                ]),                          
          )
        ]),
        )
      ),
    );
  }
}
