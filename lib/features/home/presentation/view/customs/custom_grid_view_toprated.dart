import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/responsive/extentions.dart';
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
              return ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(30.r),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${state.responseModel.results[index].posterPath}',
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
