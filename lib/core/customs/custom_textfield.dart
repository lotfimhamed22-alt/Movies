import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_constants.dart';
import 'package:movies/core/responsive/extentions.dart';
import 'package:movies/core/theme/app_colors.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {},
      readOnly: true,
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
