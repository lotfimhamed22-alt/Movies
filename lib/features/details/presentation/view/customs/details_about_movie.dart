import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movies/core/responsive/extentions.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/features/search/presentation/view/customs/custom_row_search.dart';

class DetailsAboutMovie extends StatelessWidget {
  const DetailsAboutMovie({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
  });
  final String text1;
  final String text2;
  final String text3;
  final String text4;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomRowDetailsMovieSearch(
          text: text1,
          icon: Icons.star_border,
          iconColor: AppColors.textSecondary,
          textColor: AppColors.textSecondary,
        ),
        Gap(10.h),
        Container(height: 25.h, width: 1.2.w, color: AppColors.textSecondary),
        Gap(10.h),
        CustomRowDetailsMovieSearch(
          text: text2,
          icon: Icons.bookmark_outline,
          iconColor: AppColors.textSecondary,
          textColor: AppColors.textSecondary,
        ),
        Gap(10.h),
        Container(height: 25.h, width: 1.2.w, color: AppColors.textSecondary),
        Gap(10.h),
        CustomRowDetailsMovieSearch(
          text: text3,
          icon: Icons.local_movies,
          iconColor: AppColors.textSecondary,
          textColor: AppColors.textSecondary,
        ),
        Gap(10.h),
        Container(height: 25.h, width: 1.2.w, color: AppColors.textSecondary),

        Gap(10.h),
        CustomRowDetailsMovieSearch(
          text: text4,
          icon: Icons.calendar_today,
          iconColor: AppColors.textSecondary,
          textColor: AppColors.textSecondary,
        ),
      ],
    );
  }
}
