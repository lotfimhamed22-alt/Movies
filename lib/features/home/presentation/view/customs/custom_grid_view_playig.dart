import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/constants/routes_constants.dart';
import 'package:movies/core/customs/custom_clip_rrect.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/home/presentation/view_model/now_playing/now_playing_cubit.dart';

class CustomGridViewNowPlaying extends StatelessWidget {
  const CustomGridViewNowPlaying({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingCubit, NowPlayingState>(
      builder: (context, state) {
        if (state is NowPlayingLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is NowPlayingSuccess) {
          return GridView.builder(
            itemCount: state.response.results.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 20.w,
              mainAxisSpacing: 15.h,
              childAspectRatio: 1.3 / 2,
            ),
            itemBuilder: (context, index) {
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
          );
        }
        return SizedBox();
      },
    );
  }
}
