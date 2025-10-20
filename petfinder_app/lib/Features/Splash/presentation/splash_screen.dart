import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petfinder_app/Core/constants/svgs.dart';
import 'package:petfinder_app/Core/helper/extensions.dart';
import 'package:petfinder_app/Core/routing/routes.dart';
import 'package:petfinder_app/Core/theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: SvgPicture.asset(
          Svgs.logoIcon,
        ),
      ),
    );
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (!mounted) return;
        context.pushNamed(Routes.onboardingScreen);
      },
    );
  }
}
