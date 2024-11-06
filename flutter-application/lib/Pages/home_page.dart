import 'package:flutter/material.dart';
import 'package:my_navigation_app/qrscan.dart';

class HomePage extends StatefulWidget {
  final double textSize;
  const HomePage({Key? key, required this.textSize});

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{
  final TextEditingController _result = TextEditingController();
  
  void setresult(String result){
    _result.text = result;
  }

@override
Widget build(BuildContext context) {
  return Center(
    child: SizedBox(
      width: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [TextField(
          controller: _result,
            decoration: InputDecoration(
              labelText: 'Current location',
              border: OutlineInputBorder(),
            ),
          ),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter a Location',
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => QrCodeScanner(setresult: setresult),
              ),
            ),
            child: Text("Scan QR"),
          ),
        ],
      ),
    ),
  );
}

}

