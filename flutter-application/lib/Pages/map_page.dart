import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MapPage extends StatelessWidget {
  final double textSize;
  const MapPage({super.key, required this.textSize});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
              width: screenWidth * 2,
              height: screenHeight * 2,
              child: SvgPicture.asset(
                'assets/images/mock_app_no_bg.svg',
                fit: BoxFit.none,
            ),
          ),
          Positioned(
            top: screenHeight/2 - 450, left: screenWidth/2 - 45,
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
            top: screenHeight/2 - 410, left: screenWidth/2 - 45,
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
            top: screenHeight/2 - 370, left: screenWidth/2 - 45,
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
            top: screenHeight/2 - 318, left: screenWidth/2 - 45,
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
            top: screenHeight/2 - 268, left: screenWidth/2 - 45,
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
            top: screenHeight/2 - 230, left: screenWidth/2 - 45,
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
          ),

          //Zachs addition of points
          Positioned(
            top: screenHeight/2 - 20, left: screenWidth/2 - 75,
            key: Key('J-152'),
            child: Row(
                children: <Widget>[                  
                  Text(
                    "J-152",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,                      
                    )),
                  Icon(Icons.location_pin, color: Colors.blue),
                ]),                          
          ),
          Positioned(
            top: screenHeight/2 - 20, left: screenWidth/2 + 80,
            key: Key('J-151'),
            child: Row(
                children: <Widget>[                  
                  Text(
                    "J-151",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,                      
                    )),
                  Icon(Icons.location_pin, color: Colors.blue),
                ]),                          
          ),
          Positioned(
            top: screenHeight/2 + 40, left: screenWidth/2 - 45,
            key: Key('J-156'),
            child: Row(
                children: <Widget>[                  
                  Text(
                    "J-156",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,                      
                    )),
                  Icon(Icons.location_pin, color: Colors.blue),
                ]),                          
          ),
          Positioned(
            top: screenHeight/2 + 100, left: screenWidth/2 - 45,
            key: Key('J-158'),
            child: Row(
                children: <Widget>[                  
                  Text(
                    "J-158",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,                      
                    )),
                  Icon(Icons.location_pin, color: Colors.blue),
                ]),                          
          ),
          Positioned(
            top: screenHeight/2 + 170, left: screenWidth/2 - 45,
            key: Key('J-160'),
            child: Row(
                children: <Widget>[                  
                  Text(
                    "J-160",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,                      
                    )),
                  Icon(Icons.location_pin, color: Colors.blue),
                ]),                          
          ),
          Positioned(
            top: screenHeight/2 + 260, left: screenWidth/2 - 45,
            key: Key('J-163'),
            child: Row(
                children: <Widget>[                  
                  Text(
                    "J-163",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,                      
                    )),
                  Icon(Icons.location_pin, color: Colors.blue),
                ]),                          
          ),
          Positioned(
            top: screenHeight/2 + 270, left: screenWidth/2 + 40,
            key: Key('J-165'),
            child: Row(
                children: <Widget>[                  
                  Text(
                    "J-165",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,                      
                    )),
                  Icon(Icons.location_pin, color: Colors.blue),
                ]),                          
          ),
          Positioned(
            top: screenHeight/2 + 200, left: screenWidth/2 + 40,
            key: Key('J-164'),
            child: Row(
                children: <Widget>[                  
                  Text(
                    "J-164",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,                      
                    )),
                  Icon(Icons.location_pin, color: Colors.blue),
                ]),                          
          ),
          Positioned(
            top: screenHeight/2 + 130, left: screenWidth/2 + 40,
            key: Key('J-161'),
            child: Row(
                children: <Widget>[                  
                  Text(
                    "J-161",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,                      
                    )),
                  Icon(Icons.location_pin, color: Colors.blue),
                ]),                          
          ),
          Positioned(
            top: screenHeight/2 + 35, left: screenWidth/2 + 40,
            key: Key('J-157'),
            child: Row(
                children: <Widget>[                  
                  Text(
                    "J-157",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,                      
                    )),
                  Icon(Icons.location_pin, color: Colors.blue),
                ]),                          
          ),
          Positioned(
            top: screenHeight/2 + 75, left: screenWidth/2 + 40,
            key: Key('J-159'),
            child: Row(
                children: <Widget>[                  
                  Text(
                    "J-159",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,                      
                    )),
                  Icon(Icons.location_pin, color: Colors.blue),
                ]),                          
          ),
          Positioned(
            top: screenHeight/2 - 5, left: screenWidth/2 + 25,
            key: Key('J-153'),
            child: Row(
                children: <Widget>[                  
                  Text(
                    "J-153",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,                      
                    )),
                  Icon(Icons.location_pin, color: Colors.blue),
                ]),                          
          ),
          Positioned(
            top: screenHeight/2 - 190, left: screenWidth/2 + 80,
            key: Key('J-101'),
            child: Row(
                children: <Widget>[                  
                  Text(
                    "J-101",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,                      
                    )),
                  Icon(Icons.location_pin, color: Colors.blue),
                ]),                          
          ),
          Positioned(
            top: screenHeight/2 - 230, left: screenWidth/2 + 40,
            key: Key('J-106'),
            child: Row(
                children: <Widget>[                  
                  Text(
                    "J-106",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,                      
                    )),
                  Icon(Icons.location_pin, color: Colors.blue),
                ]),                          
          ),
          Positioned(
            top: screenHeight/2 - 268, left: screenWidth/2 + 40,
            key: Key('J-108'),
            child: Row(
                children: <Widget>[                  
                  Text(
                    "J-108",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,                      
                    )),
                  Icon(Icons.location_pin, color: Colors.blue),
                ]),                          
          ),
          Positioned(
            top: screenHeight/2 - 318, left: screenWidth/2 + 40,
            key: Key('J-110'),
            child: Row(
                children: <Widget>[                  
                  Text(
                    "J-110",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,                      
                    )),
                  Icon(Icons.location_pin, color: Colors.blue),
                ]),                          
          ),
          Positioned(
            top: screenHeight/2 - 370, left: screenWidth/2 + 40,
            key: Key('J-130'),
            child: Row(
                children: <Widget>[                  
                  Text(
                    "J-130",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,                      
                    )),
                  Icon(Icons.location_pin, color: Colors.blue),
                ]),                          
          ),
          Positioned(
            top: screenHeight/2 - 410, left: screenWidth/2 + 40,
            key: Key('J-132'),
            child: Row(
                children: <Widget>[                  
                  Text(
                    "J-132",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,                      
                    )),
                  Icon(Icons.location_pin, color: Colors.blue),
                ]),                          
          ),
          Positioned(
            top: screenHeight/2 - 450, left: screenWidth/2 + 40,
            key: Key('J-134'),
            child: Row(
                children: <Widget>[                  
                  Text(
                    "J-134",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,                      
                    )),
                  Icon(Icons.location_pin, color: Colors.blue),
                ]),                          
          ),
          Positioned(
            top: screenHeight/2 - 190, left: screenWidth/2 - 75,
            key: Key('Stacks'),
            child: Row(
                children: <Widget>[                  
                  Text(
                    "Stacks",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,                      
                    )),
                  Icon(Icons.location_pin, color: Colors.blue),
                ]),                          
          ),
        ]),
        )
      ),
    );
  }
}
