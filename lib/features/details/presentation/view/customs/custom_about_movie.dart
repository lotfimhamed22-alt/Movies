import 'package:flutter/material.dart';
import 'package:movies/core/customs/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/theme/app_colors.dart';

class CustomAboutMovie extends StatelessWidget {
  const CustomAboutMovie({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13.0),
      child: CustomText(
        text: text,
        color: AppColors.textPrimary,
        fontSize: 20.sp,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
