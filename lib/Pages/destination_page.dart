import 'package:flutter/material.dart';
import 'package:my_navigation_app/Utilities/qrscan.dart';

class DestinationPage extends StatefulWidget {
  final double textSize;
  const DestinationPage({super.key, required this.textSize});

  @override
  State<DestinationPage> createState() => _HomePageState();
}

class _HomePageState extends State<DestinationPage> {
  final TextEditingController _result = TextEditingController();

  void setresult(String result) {
    _result.text = result;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * .7;
    return Center(
      child: SizedBox(
        width: screenWidth >= 250 ? screenWidth : 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 275,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'How to Use This App',
                      style: TextStyle(
                        fontSize: widget.textSize + 2,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '1. Scan the QR code at designated locations or manually enter the code.',
                          style: TextStyle(
                            fontSize: widget.textSize,
                            color: Colors.blue,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 8),
                        Text(
                          '2. Enter your desired destination in the input field below.',
                          style: TextStyle(
                            fontSize: widget.textSize,
                            color: Colors.blue,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 8),
                        Text(
                          '3. Tap the search button to get directions and follow the provided route.',
                          style: TextStyle(
                            fontSize: widget.textSize,
                            color: Colors.blue,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            TextField(
              controller: _result,
              decoration: InputDecoration(
                labelText: 'Current Location',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => QrCodeScanner(setresult: setresult)),
                  ),
                  icon: Icon(Icons.qr_code),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Destination',
              ),
            ),
            const SizedBox(height: 16),
            FloatingActionButton(
              // TODO: Connect search algorithm with button and controllers
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => QrCodeScanner(setresult: setresult),
                ),
              ),
              child: const Icon(Icons.search),
              backgroundColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
