import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petfinder_app/Core/constants/svgs.dart';
import 'package:petfinder_app/Core/helper/spacing.dart';
import 'package:petfinder_app/Core/theme/styles.dart';

class PetCard extends StatelessWidget {
  final String image;
  final String name;
  final String gender;
  final String age;
  final String distance;

  const PetCard({
    super.key,
    required this.image,
    required this.name,
    required this.gender,
    required this.age,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            color: const Color(0xffE1F8F9),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(
                image,
                width: 112.w,
                height: 112.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
          horizontalSpace(15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppTextStyles.font18Black700),
                verticalSpace(4),
                Text(
                  '$gender\n$age',
                  style: AppTextStyles.font14Subtitle400,
                ),
                verticalSpace(6),
                Row(
                  children: [
                    SvgPicture.asset(
                      Svgs.locationIcon,
                      height: 14.h,
                    ),
                    horizontalSpace(5),
                    Text(
                      distance,
                      style: AppTextStyles.font14Subtitle400,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(
            Icons.favorite_border,
            color: Colors.grey.shade500,
            size: 22.sp,
          ),
        ],
      ),
    );
  }
}
