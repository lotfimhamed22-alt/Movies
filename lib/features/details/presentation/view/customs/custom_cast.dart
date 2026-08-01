import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
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
              crossAxisSpacing: 20.w,
              mainAxisSpacing: 5.h,
              childAspectRatio: 1.w / 0.95.h,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 8,
                ),
                child: Column(
                  children: [
                    CustomClipRrect(
                      width: 140.w,
                      height: 124.h,
                      radius: 70,
                      widthImage: 140.w,
                      heightImage: 124.h,
                      imgPath:
                          'https://image.tmdb.org/t/p/w500${state.response.cast[index].profilePath}',
                    ),
                    Gap(20.h),
                    CustomText(
                      text: state.response.cast[index].name,
                      color: AppColors.textPrimary,
                      fontSize: 20.sp,
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
