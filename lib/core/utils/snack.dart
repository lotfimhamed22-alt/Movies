import 'package:flutter/material.dart';
import 'package:movies/core/customs/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/theme/app_colors.dart';

class Snack {
  static void snack({
    required BuildContext context,
    required Color textColor,
    required String text,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.success,
        content: Container(
          width: double.infinity,
          height: 50.h,
          child: CustomText(
            text: text,
            color: textColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
