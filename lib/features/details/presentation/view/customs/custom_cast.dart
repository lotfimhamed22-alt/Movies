import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:movies/core/constants/app_sized.dart';
import 'package:movies/core/customs/custom_clip_rrect.dart';
import 'package:movies/core/customs/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/features/details/presentation/view_model/cast/cubit/cast_cubit.dart';

class CustomCast extends StatelessWidget {
  const CustomCast({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastCubit, CastState>(
      builder: (context, state) {
        if (state is CastSuccess) {
          return GridView.builder(
            itemCount: state.response.cast.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5.w,
              childAspectRatio: 0.1.w / 0.1.h,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  vertical: AppSized.height * 0.01,
                  horizontal: AppSized.width * 0.01,
                ),
                child: Column(
                  children: [
                    CustomClipRrect(
                      width: 90.w,
                      height: 80.h,
                      radius: 70.r,
                      // widthImage: 20.w,
                      // heightImage: 124.h,
                      imgPath:
                          'https://image.tmdb.org/t/p/w500${state.response.cast[index].profilePath}',
                    ),
                    Gap(10.h),
                    CustomText(
                      text: state.response.cast[index].name,
                      color: AppColors.textPrimary,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w900,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
          );
        }
        return SizedBox();
      },
    );
  }
}
