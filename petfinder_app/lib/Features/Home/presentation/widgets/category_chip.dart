import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfinder_app/Core/theme/styles.dart';

class CategoryChip extends StatelessWidget {
  final String title;
  final bool isSelected;

  const CategoryChip({super.key, required this.title, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Center(
        child: Text(title, style: AppTextStyles.font14TealLight600),
      ),
    );
  }
}
