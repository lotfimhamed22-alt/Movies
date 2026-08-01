import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/theme/app_colors.dart';

class Customtextformfield extends StatelessWidget {
  const Customtextformfield({
    super.key,
    required this.username,
    this.validator,
    this.suffixIcon,
    this.controller,
  });
  final String username;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      style: TextStyle(color: AppColors.success),
      cursorColor: AppColors.success,
      decoration: InputDecoration(
        labelText: username,
        labelStyle: TextStyle(color: AppColors.textPrimary),
        fillColor: AppColors.searchColor,
        filled: true,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.searchColor),
          borderRadius: BorderRadius.circular(18.r),
        ),
      ),
    );
  }
}
