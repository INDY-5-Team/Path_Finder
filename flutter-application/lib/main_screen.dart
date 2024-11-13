import 'package:flutter/material.dart';
//

import 'Pages/about_us_page.dart';
import 'Pages/destination_page.dart';
import 'Pages/map_page.dart';
import 'Pages/settings_page.dart';

class MainScreen extends StatefulWidget {
  final bool isDarkMode;
  final double textSize;
  final Function(bool) onDarkModeToggle;
  final Function(double) onTextSizeChange;

  const MainScreen({
    super.key,
    required this.isDarkMode,
    required this.textSize,
    required this.onDarkModeToggle,
    required this.onTextSizeChange,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  late List<Widget> _screens;

  @override
  void didUpdateWidget(MainScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.textSize != widget.textSize) {
      setState(() {
        _screens = [
          MapPage(textSize: widget.textSize),
          DestinationPage(textSize: widget.textSize),
          AboutUsPage(textSize: widget.textSize),
        ];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _screens = [
      MapPage(textSize: widget.textSize),
      DestinationPage(textSize: widget.textSize),
      AboutUsPage(textSize: widget.textSize),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _selectedIndex == 0 ? 'MAP' : _selectedIndex == 1 ? 'DESTINATIONS' : 'ABOUT US',
          style: const TextStyle(
            fontFamily: 'Sans-serif',
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.blue,
        toolbarHeight: 80, // Fill the whole top bar
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop),
            label: 'Destinations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info, size: 20.0),
            label: 'About Us',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: SizedBox( // Fill the entire header with blue
                width: double.infinity,
                child: Text(
                  'Menu',
                  style: TextStyle(
                    fontFamily: 'Sans-serif',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.pin_drop, color: Colors.blue),
              title: const Text('Destinations',
                  style: TextStyle(fontFamily: 'Sans-serif', color: Colors.blue)),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 1;
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.map, color: Colors.blue),
              title: const Text('Map',
                  style: TextStyle(fontFamily: 'Sans-serif', color: Colors.blue)),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 0;
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.blue),
              title: const Text('About Us',
                  style: TextStyle(fontFamily: 'Sans-serif', color: Colors.blue)),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 2;
                });
              },
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: const Icon(Icons.settings, color: Colors.blue),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsPage(
                        isDarkMode: widget.isDarkMode,
                        textSize: widget.textSize,
                        onDarkModeToggle: widget.onDarkModeToggle,
                        onTextSizeChange: widget.onTextSizeChange,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
