import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petfinder_app/Core/constants/svgs.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(Svgs.homeIcon, height: 24.h),
          SvgPicture.asset(Svgs.heartIcon, height: 24.h),
          SvgPicture.asset(Svgs.messagesIcon, height: 24.h),
          SvgPicture.asset(Svgs.profileIcon, height: 24.h),
        ],
      ),
    );
  }
}
