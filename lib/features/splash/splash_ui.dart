import 'package:flutter/material.dart';
import 'package:movies/core/constants/asset_constants.dart';
import 'package:movies/core/customs/custom_text.dart';
import 'package:movies/core/responsive/extentions.dart';
import 'package:movies/core/theme/app_colors.dart';

class SplashUi extends StatelessWidget {
  const SplashUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AssetConstants.logo, width: 175.w, height: 175.h),
              CustomText(
                text: "Welcome To Movies",
                fontSize: 30.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
