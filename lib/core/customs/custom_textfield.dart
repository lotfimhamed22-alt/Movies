import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/theme/app_colors.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.readOnly,
    this.onTap,
    this.controller,
    this.onChanged,
  });
  final bool readOnly;
  final void Function()? onTap;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      readOnly: readOnly,
      controller: controller,
      onChanged: onChanged,
      cursorColor: AppColors.success,
      style: TextStyle(color: AppColors.success),
      decoration: InputDecoration(
        hintText: AppConstants.search,
        hintStyle: TextStyle(color: AppColors.textSecondary),
        suffixIcon: Icon(Icons.search, color: AppColors.textSecondary),
        filled: true,
        fillColor: AppColors.searchColor,

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.r),
          borderSide: BorderSide(color: AppColors.searchColor),
        ),
      ),
    );
  }
}
