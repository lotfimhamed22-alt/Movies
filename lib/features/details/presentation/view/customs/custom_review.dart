import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:movies/core/customs/custom_clip_rrect.dart';
import 'package:movies/core/customs/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/features/details/presentation/view_model/review/cubit/review_cubit.dart';

class CustomReview extends StatelessWidget {
  const CustomReview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewCubit, ReviewState>(
      builder: (context, state) {
        if (state is ReviewSuccess) {
          return SizedBox(
            height: 200.h,
            width: double.infinity.w,
            child: ListView.builder(
              itemCount: state.reviewsModel.results.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 10,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          CustomClipRrect(
                            width: 65.w,
                            height: 65.h,
                            imgPath:
                                'https://image.tmdb.org/t/p/w500${state.reviewsModel.results[index].authorDetails.avatarPath}',
                          ),
                          Gap(15.h),
                          CustomText(
                            text: state
                                .reviewsModel
                                .results[index]
                                .authorDetails
                                .rating
                                .toString(),
                            color: AppColors.myBlue,
                            fontSize: 15.sp,
                          ),
                        ],
                      ),
                      Gap(20.w),
                      SizedBox(
                        height: 140.h,
                        width: 350.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            CustomText(
                              text: state.reviewsModel.results[index].author
                                  .toString(),
                              fontSize: 24.sp,
                              overflow: TextOverflow.ellipsis,
                              color: AppColors.textPrimary,
                            ),
                            Gap(10.h),
                            CustomText(
                              text: state.reviewsModel.results[index].content,
                              // overflow: TextOverflow.ellipsis,
                              fontSize: 18.sp,
                              color: AppColors.textPrimary,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
