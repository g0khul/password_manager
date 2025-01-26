import 'package:flutter/material.dart';
import 'package:password_manager/routes/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    Center(child: Text('Home Screen')),
    Center(child: Text('Screen 1')),
    Center(child: Text('Screen 2')),
    Center(child: Text('Screen 3')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App Bar'),
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Screen 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Screen 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Screen 3',
          ),
        ],
      ),
    );
  }
}
