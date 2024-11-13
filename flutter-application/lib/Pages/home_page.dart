import 'package:flutter/material.dart';
import 'package:my_navigation_app/Utilities/qrscan.dart';

class HomePage extends StatefulWidget {
  final double textSize;
  const HomePage({super.key, required this.textSize});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          children: [SizedBox(
            height: 275,
            child: SingleChildScrollView(
              child: Column(
                children: [Text(
                'How to use?',
                  style: TextStyle(
                    fontSize: widget.textSize + 2,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF00A94F)),
                  ),
                Text('1. Scan QR code on designated "anchor" locations or input it manually\n'
                '2. Input destination\n'
                '3. Press search and follow directions',
                  style: TextStyle(
                    fontSize: widget.textSize,
                  color: const Color(0xFF00A94F)),
                  textAlign: TextAlign.left,
                  ),
                ],
              )
            )
          ),
            TextField(controller: _result,
              decoration: InputDecoration(
                labelText: 'Current location',
                border: OutlineInputBorder(),
                suffixIcon: (kIsWeb || !Platform.isWindows)
                    ? IconButton(
                        icon: Icon(Icons.qr_code),
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                QrCodeScanner(setresult: setresult),
                          ),
                        ),
                      )
                    : null,
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter a Destination',
              ),
            ),
            TextButton( //TODO: connect search algorithm with button and controllers
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => QrCodeScanner(setresult: setresult),
                ),
              ),
              child: Text("Search",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
