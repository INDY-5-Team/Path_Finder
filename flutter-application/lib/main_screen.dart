import 'package:flutter/material.dart';

import 'Pages/about_us_page.dart';
import 'Pages/home_page.dart';
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
          HomePage(textSize: widget.textSize),
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
      HomePage(textSize: widget.textSize),
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
        title: _selectedIndex == 1
            ? Image.asset(
                'assets/choa_banner_logo.png',
                height: 40,
              )
            : Text(
                _selectedIndex == 0 ? 'MAP' : 'ABOUT US',
                style: const TextStyle(
                    fontFamily: 'Sans-serif',
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
        backgroundColor: const Color(0xFF00A94F),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 20.0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About Us',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        backgroundColor: const Color(0xFF00A94F),
        onTap: _onItemTapped,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF00A94F),
              ),
              child: Image.asset(
                'assets/choa_banner_logo.png',
                fit: BoxFit.contain,
                height: 100,
                width: 100,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.white),
              tileColor: const Color(0xFF00A94F),
              title: const Text('Home',
                  style:
                      TextStyle(fontFamily: 'Sans-serif', color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 1;
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.white),
              tileColor: const Color(0xFF00A94F),
              title: const Text('Settings',
                  style:
                      TextStyle(fontFamily: 'Sans-serif', color: Colors.white)),
              onTap: () {
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
          ],
        ),
      ),
    );
  }
}
