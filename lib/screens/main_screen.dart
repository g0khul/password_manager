import 'package:flutter/material.dart';
import 'package:password_manager/screens/home_screen.dart';
import 'package:password_manager/screens/notes_screen.dart';
import 'package:password_manager/screens/generator_screen.dart';
import 'package:password_manager/screens/settings_screen.dart';
import 'package:password_manager/utils/constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    NotesScreen(),
    GeneratorScreen(),
    SettingsScreen(),
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
        title: Text(Constants.appName),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search action
            },
          ),
        ],
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: Constants.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notes),
            label: Constants.notes,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.key),
            label: Constants.generator,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: Constants.settings,
          ),
        ],
      ),
    );
  }
}
