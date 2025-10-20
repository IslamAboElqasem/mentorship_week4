import 'package:flutter/material.dart';
import 'package:petfinder_app/Core/theme/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onTap,
      this.title,
      this.child,
      required this.color});
  final void Function()? onTap;
  final String? title;
  final Widget? child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: Colors.teal,
      ),
      child: child ?? Text(title!, style: AppTextStyles.font18White500),
    );
  }
}
