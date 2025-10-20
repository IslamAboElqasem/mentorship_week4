import 'package:flutter/material.dart';
import 'package:petfinder_app/Core/routing/routes.dart';
import 'package:petfinder_app/Features/Splash/presentation/splash_screen.dart';
import 'package:petfinder_app/Features/onboarding/presentation/onboarding_screen.dart';

class AppRouter {
  static const String initialRoute = '/';

  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      default:
        return null;
    }
  }
}
