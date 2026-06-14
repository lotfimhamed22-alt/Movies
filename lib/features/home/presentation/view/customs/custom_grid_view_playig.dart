import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/responsive/extentions.dart';
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
              crossAxisSpacing: 25.w,
              mainAxisSpacing: 20.h,
              childAspectRatio: 1 / 1.6,
            ),
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(30.r),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${state.response.results[index].posterPath}',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.error),
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
