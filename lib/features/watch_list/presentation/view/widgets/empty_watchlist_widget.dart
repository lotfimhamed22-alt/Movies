import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movies/core/constants/app_constants.dart';
import 'package:movies/core/constants/asset_constants.dart';
import 'package:movies/core/customs/custom_text.dart';
import 'package:movies/core/responsive/extentions.dart';
import 'package:movies/core/theme/app_colors.dart';

class EmptyWatchListWidget extends StatelessWidget {
  const EmptyWatchListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(AssetConstants.emptyBox, width: 120.w),
          Gap(20.h),
          CustomText(
            text: AppConstants.noMovieYet,
            color: AppColors.textPrimary,
            fontSize: 20.sp,
          ),
          Gap(20.h),
          CustomText(
            text: AppConstants.findYourMovie,
            color: AppColors.textSecondary,
            fontSize: 16.sp,
          ),
        ],
      ),
    );
  }
}
