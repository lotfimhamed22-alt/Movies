import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          return Center(
            child: CircularProgressIndicator(color: AppColors.textPrimary),
          );
        }
        if (state is NowPlayingSuccess) {
          return CarouselSlider.builder(
            itemCount: state.response.results.length,
            options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 0.47.w,
              enlargeCenterPage: true,
              autoPlayCurve: Curves.linear,
              autoPlayAnimationDuration: Duration(seconds: 2),
            ),
            itemBuilder: (context, index, realIndex) {
              return ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(30.r),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${state.response.results[index].posterPath}',
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.error),
                ),
              );
            },
          );
        }
        return SizedBox(child: CustomText(text: "no data"));
      },
    );
  }
}
