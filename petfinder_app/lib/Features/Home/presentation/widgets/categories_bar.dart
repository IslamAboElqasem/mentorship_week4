import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfinder_app/Features/Home/presentation/widgets/category_chip.dart';

class CategoriesBar extends StatelessWidget {
  const CategoriesBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          CategoryChip(title: 'All', isSelected: true),
          CategoryChip(title: 'Cats'),
          CategoryChip(title: 'Dogs'),
          CategoryChip(title: 'Birds'),
          CategoryChip(title: 'Fish'),
          CategoryChip(title: 'Reptiles'),
        ],
      ),
    );
  }
}
