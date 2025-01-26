import 'package:flutter/material.dart';
import 'package:password_manager/routes/app_routes.dart';
import 'package:password_manager/screens/home_screen.dart';
import 'package:password_manager/screens/placeholder_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case AppRoutes.screen1:
        return MaterialPageRoute(
            builder: (_) => PlaceholderScreen(title: 'Screen 1'));
      case AppRoutes.screen2:
        return MaterialPageRoute(
            builder: (_) => PlaceholderScreen(title: 'Screen 2'));
      case AppRoutes.screen3:
        return MaterialPageRoute(
            builder: (_) => PlaceholderScreen(title: 'Screen 3'));
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}
