import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/constants/routes_constants.dart';
import 'package:movies/core/customs/custom_clip_rrect.dart';
import 'package:movies/core/customs/custom_text.dart';
import 'package:movies/core/responsive/extentions.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/features/home/presentation/view_model/now_playing/now_playing_cubit.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingCubit, NowPlayingState>(
      builder: (context, state) {
        if (state is NowPlayingLoading) {
          return SizedBox(
            height: 250.h,

            child: Center(
              child: CircularProgressIndicator(color: AppColors.textPrimary),
            ),
          );
        }
        if (state is NowPlayingSuccess) {
          return SizedBox(
            height: 250.h,
            child: CarouselSlider.builder(
              itemCount: state.response.results.length,
              options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 0.47.w,
                enlargeCenterPage: true,
                autoPlayCurve: Curves.linear,
                autoPlayAnimationDuration: Duration(seconds: 2),
              ),
              itemBuilder: (context, index, realIndex) {
                return GestureDetector(
                  onTap: () => context.push(
                    RoutesConstants.detailsPath,
                    extra: state.response.results[index],
                  ),
                  child: CustomClipRrect(
                    imgPath:
                        'https://image.tmdb.org/t/p/w500${state.response.results[index].posterPath}',
                  ),
                );
              },
            ),
          );
        }
        return SizedBox(child: CustomText(text: "no data"));
      },
    );
  }
}
