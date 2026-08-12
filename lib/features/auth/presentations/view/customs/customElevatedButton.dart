import 'package:flutter/material.dart';
import 'package:movies/core/customs/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/theme/app_colors.dart';

class Customelevatedbutton extends StatelessWidget {
  const Customelevatedbutton({
    super.key,
    this.onPressed,
    required this.text,
    this.width = 200,
  });
  final void Function()? onPressed;
  final String text;
  final double width;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,

      child: CustomText(
        text: text,
        fontSize: 22.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.myBlue,
        // foregroundColor: AppColors.myBlue,
        // disabledBackgroundColor: AppColors.myBlue,
        fixedSize: Size(width.w, 60.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.r),
          side: BorderSide(width: 2.w, color: AppColors.success),
        ),
      ),
    );
  }
}
