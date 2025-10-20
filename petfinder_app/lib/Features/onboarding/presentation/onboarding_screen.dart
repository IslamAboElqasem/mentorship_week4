import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petfinder_app/Core/constants/svgs.dart';

import 'package:petfinder_app/Core/helper/extensions.dart';
import 'package:petfinder_app/Core/helper/spacing.dart';
import 'package:petfinder_app/Core/routing/routes.dart';
import 'package:petfinder_app/Core/theme/app_colors.dart';
import 'package:petfinder_app/Core/theme/styles.dart';
import 'package:petfinder_app/Core/widgets/custom_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            children: [
              const Expanded(
                flex: 2,
                child: Image(
                  image: AssetImage(
                      'assets/images/76acd944660dd48d6bb3785fe2100da1fe53de62.png'),
                  fit: BoxFit.cover,
                ),
              ),
              verticalSpace(32),
              Text(
                'Find Your Best\nCompanion With Us',
                style: AppTextStyles.font32Dark700,
                textAlign: TextAlign.center,
              ),
              verticalSpace(16),
              Text(
                'Join & discover the best suitable pets as per your preferences in your location',
                style: AppTextStyles.font16Description400,
                textAlign: TextAlign.center,
              ),
              verticalSpace(32),
              SizedBox(
                  width: double.infinity,
                  height: 44.h,
                  child: CustomButton(
                    color: AppColors.tealLight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(Svgs.petsIcon),
                        horizontalSpace(12),
                        Text(
                          'Get Started',
                          style: AppTextStyles.font18White500,
                        ),
                      ],
                    ),
                    onTap: () {
                      context.pushReplacementNamed(Routes.homeScreen);
                    },
                  )),
              verticalSpace(40),
            ],
          ),
        ),
      ),
    );
  }
}
