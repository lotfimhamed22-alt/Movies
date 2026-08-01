import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movies/core/customs/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRowDetailsMovieSearch extends StatelessWidget {
  const CustomRowDetailsMovieSearch({
    super.key,
    this.icon,
    required this.text,
    this.iconColor,
    this.textColor,
  });
  final IconData? icon;
  final String text;
  final Color? iconColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: 25.w),
        Gap(5.w),
        CustomText(text: text, color: textColor, fontSize: 16.sp),
      ],
    );
  }
}
