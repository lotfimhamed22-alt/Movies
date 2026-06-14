import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:movies/core/constants/app_constants.dart';
import 'package:movies/core/customs/custom_text.dart';
import 'package:movies/core/customs/custom_textfield.dart';
import 'package:movies/core/responsive/extentions.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/features/home/presentation/view/customs/custom_carousel.dart';
import 'package:movies/features/home/presentation/view/customs/custom_grid_view_playig.dart';
import 'package:movies/features/home/presentation/view/customs/custom_grid_view_upcoming.dart';
import 'package:movies/features/home/presentation/view/customs/custom_grid_view_popular.dart';
import 'package:movies/features/home/presentation/view/customs/custom_grid_view_toprated.dart';
import 'package:movies/features/home/presentation/view_model/now_playing/now_playing_cubit.dart';
import 'package:movies/features/home/presentation/view_model/popular/popular_cubit.dart';
import 'package:movies/features/home/presentation/view_model/top_rated/top_rated_cubit.dart';
import 'package:movies/features/home/presentation/view_model/up_coming/up_coming_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<NowPlayingCubit>().getNowPlayingMovies();
    context.read<UpComingCubit>().getUpComingMovies();
    context.read<TopRatedCubit>().getTopRatedMovies();
    context.read<PopularCubit>().getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(65.h),
              CustomText(
                text: AppConstants.homeTitle,
                fontSize: 24.sp,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
              Gap(20.h),
              CustomTextfield(),
              Gap(30.h),
              CustomCarousel(),
              Gap(50.h),
              TabBar(
                labelColor: AppColors.textPrimary,
                unselectedLabelColor: AppColors.myBlue,
                indicatorColor: AppColors.success,
                dividerColor: AppColors.searchColor,

                tabs: [
                  Tab(
                    child: CustomText(
                      text: AppConstants.nowPlaying,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Tab(
                    child: CustomText(
                      text: AppConstants.upComing,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Tab(
                    child: CustomText(
                      text: AppConstants.topRated,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Tab(
                    child: CustomText(
                      text: AppConstants.popular,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    CustomGridViewNowPlaying(),
                    CustomGridViewUpComing(),
                    CustomGridViewTopRated(),
                    CustomGridViewPopular(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
