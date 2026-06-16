import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/constants/routes_constants.dart';
import 'package:movies/core/customs/custom_clip_rrect.dart';
import 'package:movies/core/responsive/extentions.dart';
import 'package:movies/features/home/presentation/view_model/up_coming/up_coming_cubit.dart';

class CustomGridViewUpComing extends StatelessWidget {
  const CustomGridViewUpComing({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpComingCubit, UpComingState>(
      builder: (context, state) {
        if (state is UpComingLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is UpComingSuccess) {
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
