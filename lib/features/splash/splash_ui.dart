import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
              Image.asset(
                AssetConstants.logo,
                width: 150.w,
                // height: 160.h,
                fit: BoxFit.cover,
              ),
              Gap(20.h),
              CustomText(
                text: "Welcome To Movies",
                fontSize: 25.sp,
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
