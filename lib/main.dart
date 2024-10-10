import 'package:flutter/material.dart';

void main() => runApp(CHOAApp());

class CHOAApp extends StatefulWidget {
  @override
  _CHOAAppState createState() => _CHOAAppState();
}

class _CHOAAppState extends State<CHOAApp> {
  bool _isDarkMode = false;
  double _textSize = 24.0;

  void _toggleDarkMode(bool value) {
    setState(() {
      _isDarkMode = value;
    });
  }

  void _changeTextSize(double value) {
    setState(() {
      _textSize = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CHOA Mobile App',
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: MainScreen(
        isDarkMode: _isDarkMode,
        textSize: _textSize,
        onDarkModeToggle: _toggleDarkMode,
        onTextSizeChange: _changeTextSize,
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  final bool isDarkMode;
  final double textSize;
  final Function(bool) onDarkModeToggle;
  final Function(double) onTextSizeChange;

  MainScreen({
    required this.isDarkMode,
    required this.textSize,
    required this.onDarkModeToggle,
    required this.onTextSizeChange,
  });

  @override
  _MainScreenState createState() => _MainScreenState();
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
                style: TextStyle(fontFamily: 'Sans-serif', fontWeight: FontWeight.bold, fontSize: 24),
              ),
        backgroundColor: Color(0xFF00A94F),
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
        backgroundColor: Color(0xFF00A94F),
        onTap: _onItemTapped,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
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
              leading: Icon(Icons.home, color: Colors.white),
              tileColor: Color(0xFF00A94F),
              title: Text('Home', style: TextStyle(fontFamily: 'Sans-serif', color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 1;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.white),
              tileColor: Color(0xFF00A94F),
              title: Text('Settings', style: TextStyle(fontFamily: 'Sans-serif', color: Colors.white)),
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

class AboutUsPage extends StatelessWidget {
  final double textSize;
  AboutUsPage({required this.textSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'INDY-5 CHOA Map Application',
              style: TextStyle(fontFamily: 'Sans-serif', fontSize: textSize + 12, fontWeight: FontWeight.bold, color: Color(0xFF00A94F)),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Group Members: Harrison, Zach, Lucas, Eddie',
              style: TextStyle(fontFamily: 'Sans-serif', fontSize: textSize + 4, fontWeight: FontWeight.w600, color: Color(0xFF00A94F)),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'The CHOA Map Application is a mobile app designed to help patients, families, and visitors navigate through the Children\'s Healthcare of Atlanta (CHOA) hospital using checkpoints. The inspiration for this project came from our lead documentation and algorithms engineer, Zach, whose mother works at CHOA. She noticed how confusing the layout of the new hospital additions could be, and Zach decided to find a solution.\n'
              'Zach brought the rest of the team together to develop this mobile application, aiming to improve the experience of navigating the hospital. Initially, the idea was to use QR-code checkpoints for patients once they checked in, with a simple database to verify information and authorization. This would allow users to receive an ID linked to a specific room, enabling navigation through the hospital using different methods, such as QR-codes, GPS, or a roadmap\n.'
              'However, due to CHOA\'s security and privacy policies, we had to adjust our plan. The current version of the CHOA Map Application is a beta that keeps the core idea intact, though all data is mocked for demonstration purposes. We are excited to present this version to you and continue our journey in developing a helpful tool for hospital visitors.'
              ,style: TextStyle(fontFamily: 'Sans-serif', fontSize: textSize, color: Color(0xFF00A94F)),
            ),
          ],
        ),
      ),
    );
  }
}

class MapPage extends StatelessWidget {
  final double textSize;
  MapPage({required this.textSize});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Map Page - Empty!',
        style: TextStyle(fontFamily: 'Sans-serif', fontSize: textSize, color: Color(0xFF00A94F)),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final double textSize;
  HomePage({required this.textSize});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Home Page - Empty!',
        style: TextStyle(fontFamily: 'Sans-serif', fontSize: textSize, color: Color(0xFF00A94F)),
      ),
    );
  }
}

class SettingsPage extends StatefulWidget {
  final bool isDarkMode;
  final double textSize;
  final Function(bool) onDarkModeToggle;
  final Function(double) onTextSizeChange;

  SettingsPage({
    required this.isDarkMode,
    required this.textSize,
    required this.onDarkModeToggle,
    required this.onTextSizeChange,
  });

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool _isDarkMode;
  late double _textSize;

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.isDarkMode;
    _textSize = widget.textSize;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Settings'),
        backgroundColor: Color(0xFF00A94F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              title: Text('Dark Mode'),
              value: _isDarkMode,
              onChanged: (bool value) {
                setState(() {
                  _isDarkMode = value;
                });
                widget.onDarkModeToggle(value);
              },
            ),
            SizedBox(height: 20),
            Text('Text Size', style: TextStyle(fontFamily: 'Sans-serif', fontSize: 18)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Aa', style: TextStyle(fontFamily: 'Sans-serif', fontSize: 12)),
                Expanded(
                  child: Slider(
                    value: _textSize,
                    min: 12.0,
                    max: 36.0,
                    divisions: 2,
                    label: _textSize.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _textSize = value;
                      });
                      widget.onTextSizeChange(value);
                    },
                  ),
                ),
                Text('Aa', style: TextStyle(fontFamily: 'Sans-serif', fontSize: 36)),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Settings Preview',
                style: TextStyle(fontFamily: 'Sans-serif', fontSize: _textSize),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
