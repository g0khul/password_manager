import 'package:flutter/material.dart';
import 'package:password_manager/routes/app_routes.dart';
import 'package:password_manager/screens/home_screen.dart';
import 'package:password_manager/screens/notes_screen.dart';
import 'package:password_manager/screens/generator_screen.dart';
import 'package:password_manager/screens/settings_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case AppRoutes.secureNotes:
        return MaterialPageRoute(builder: (_) => NotesScreen());
      case AppRoutes.generator:
        return MaterialPageRoute(builder: (_) => GeneratorScreen());
      case AppRoutes.settings:
        return MaterialPageRoute(builder: (_) => SettingsScreen());
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}
