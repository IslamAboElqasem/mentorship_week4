import 'package:flutter/material.dart';
import 'package:petfinder_app/Core/routing/routes.dart';

class AppRouter {
  static const String initialRoute = '/';

  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
      // return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return null;
    }
  }
}
