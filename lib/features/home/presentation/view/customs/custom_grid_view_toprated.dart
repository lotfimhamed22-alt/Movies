import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/constants/routes_constants.dart';
import 'package:movies/core/customs/custom_clip_rrect.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/home/presentation/view_model/top_rated/top_rated_cubit.dart';

class CustomGridViewTopRated extends StatelessWidget {
  const CustomGridViewTopRated({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedCubit, TopRatedState>(
      builder: (context, state) {
        if (state is TopRatedLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is TopRatedSuccess) {
          return GridView.builder(
            itemCount: state.responseModel.results.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 25.w,
              mainAxisSpacing: 20.h,
              childAspectRatio: 1 / 1.6,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => context.push(
                  RoutesConstants.detailsPath,
                  extra: state.responseModel.results[index],
                ),
                child: CustomClipRrect(
                  imgPath:
                      'https://image.tmdb.org/t/p/w500${state.responseModel.results[index].posterPath}',
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
