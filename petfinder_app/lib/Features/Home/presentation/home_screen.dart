import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petfinder_app/Core/constants/app_images.dart';
import 'package:petfinder_app/Core/constants/svgs.dart';
import 'package:petfinder_app/Core/theme/styles.dart';
import 'package:petfinder_app/Features/Home/presentation/widgets/bottom_navigation_bar.dart';
import 'package:petfinder_app/Features/Home/presentation/widgets/categories_bar.dart';
import 'package:petfinder_app/Features/Home/presentation/widgets/pet_card.dart';

SizedBox verticalSpace(double height) => SizedBox(height: height.h);
SizedBox horizontalSpace(double width) => SizedBox(width: width.w);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(20),
                // Header Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Find Your Forever Pet',
                        style: AppTextStyles.font24Black700),
                    SvgPicture.asset(
                      Svgs.notificationIcon,
                      height: 24.h,
                    ),
                  ],
                ),
                verticalSpace(20),

                // Search Bar
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        Svgs.searchIcon,
                        height: 20.h,
                      ),
                      horizontalSpace(10),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search',
                            hintStyle: AppTextStyles.font16Description400,
                          ),
                        ),
                      ),
                      SvgPicture.asset(
                        Svgs.filterIcon,
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
                verticalSpace(20),

                // Categories
                Text(
                  'Categories',
                  style: AppTextStyles.font20Black700,
                ),
                verticalSpace(10),
                const CategoriesBar(),
                verticalSpace(20),

                // Pets List
                PetCard(
                  image: AppImages.onboardingImage,
                  name: 'Joli',
                  gender: 'Female',
                  age: '5 Months Old',
                  distance: '1.6 km away',
                ),
                verticalSpace(10),
                PetCard(
                  image: AppImages.onboardingImage,
                  name: 'Tom',
                  gender: 'Male',
                  age: '1 year Old',
                  distance: '2.7 km away',
                ),
                verticalSpace(10),
                PetCard(
                  image: AppImages.onboardingImage,
                  name: 'Oliver',
                  gender: 'Male & Female',
                  age: '3 Months Old',
                  distance: '2 km away',
                ),
                verticalSpace(10),
                PetCard(
                  image: AppImages.onboardingImage,
                  name: 'Shelly',
                  gender: 'Female',
                  age: '1.5 year Old',
                  distance: '3 km away',
                ),
                verticalSpace(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
