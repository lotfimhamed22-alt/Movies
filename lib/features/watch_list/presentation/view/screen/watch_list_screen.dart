// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:movies/core/constants/app_constants.dart';
import 'package:movies/core/constants/routes_constants.dart';
import 'package:movies/core/customs/custom_app_bar.dart';
import 'package:movies/core/customs/custom_clip_rrect.dart';
import 'package:movies/core/customs/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/utils/snack.dart';
import 'package:movies/features/home/data/models/movie_model.dart';
import 'package:movies/features/search/presentation/view/customs/custom_row_search.dart';
import 'package:movies/features/watch_list/data/model/movie_model_watchlist.dart';
import 'package:movies/features/watch_list/presentation/view/widgets/empty_watchlist_widget.dart';
import 'package:movies/features/watch_list/presentation/view_model/addmovie/addmovie_cubit.dart';
import 'package:movies/features/watch_list/presentation/view_model/delete_movie/cubit/delete_movie_cubit.dart';
import 'package:movies/features/watch_list/presentation/view_model/get_movie/cubit/get_movie_cubit.dart';

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({super.key});

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  @override
  void initState() {
    context.read<GetMovieCubit>().getMoveToWatchList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: AppConstants.watchList),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap(20.h),
            BlocBuilder<GetMovieCubit, GetMovieState>(
              builder: (context, state) {
                if (state is GetMovieSuccess) {
                  if (state.movies.isEmpty) {
                    return EmptyWatchListWidget();
                  }
                  return SizedBox(
                    height: 740.h,
                    child: ListView.builder(
                      itemCount: state.movies.length,
                      itemBuilder: (context, index) {
                        List<MovieModelWatchlist> movie = state.movies;
                        return Padding(
                          padding: const EdgeInsets.only(
                            bottom: 12.0,
                            right: 20,
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 160.h,
                                width: 125.w,
                                child: GestureDetector(
                                  onTap: () => context.push(
                                    RoutesConstants.detailsPath,
                                    extra: MovieModel(
                                      id: state.movies[index].id,
                                      title: state.movies[index].title,
                                      overview: state.movies[index].overview,
                                      posterPath:
                                          state.movies[index].posterPath,
                                      backdropPath:
                                          state.movies[index].backdropPath,
                                      releaseDate:
                                          state.movies[index].releaseDate,
                                      voteAverage:
                                          state.movies[index].voteAverage,
                                      voteCount: state.movies[index].voteCount,
                                      popularity:
                                          state.movies[index].popularity,
                                      genreIds: state.movies[index].genreIds,
                                    ),
                                  ),
                                  child: CustomClipRrect(
                                    imgPath:
                                        'https://image.tmdb.org/t/p/w500${state.movies[index].posterPath}',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                ),
                                child: SizedBox(
                                  width: 235.w,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: state.movies[index].title,
                                        color: AppColors.textPrimary,
                                        fontSize: 22.sp,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Gap(20.h),
                                      CustomRowDetailsMovieSearch(
                                        text: state.movies[index].id.toString(),
                                        icon: Icons.star_border,
                                        iconColor: AppColors.warning,
                                        textColor: AppColors.warning,
                                      ),
                                      Gap(5.h),
                                      CustomRowDetailsMovieSearch(
                                        text: state.movies[index].releaseDate,
                                        icon: Icons.bookmark_outline,
                                        iconColor: AppColors.textSecondary,
                                        textColor: AppColors.textSecondary,
                                      ),
                                      Gap(5.h),
                                      CustomRowDetailsMovieSearch(
                                        text: state.movies[index].voteAverage
                                            .toString(),
                                        icon: Icons.local_movies,
                                        iconColor: AppColors.textSecondary,
                                        textColor: AppColors.textSecondary,
                                      ),
                                      Gap(5.h),
                                      CustomRowDetailsMovieSearch(
                                        text: state.movies[index].voteCount
                                            .toString(),
                                        icon: Icons.calendar_today,
                                        iconColor: AppColors.textSecondary,
                                        textColor: AppColors.textSecondary,
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              Spacer(),
                              _getDeleteMovie(movie, index),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
                return Center(
                  child: CustomText(
                    text: AppConstants.noMovieYet,
                    color: AppColors.textPrimary,
                    fontSize: 20.sp,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  BlocBuilder<DeleteMovieCubit, DeleteMovieState> _getDeleteMovie(
    List<MovieModelWatchlist> movie,
    int index,
  ) {
    return BlocBuilder<DeleteMovieCubit, DeleteMovieState>(
      builder: (context, state) {
        print("delete");
        return GestureDetector(
          onTap: () {
            _deleteMovieFromWatchList(movie, index, context);
          },
          child: Icon(Icons.delete, size: 45.w, color: AppColors.error),
        );
      },
    );
  }

  void _deleteMovieFromWatchList(
    List<MovieModelWatchlist> movie,
    int index,
    BuildContext context,
  ) {
    print(movie[index].id);
    context.read<DeleteMovieCubit>().removeMovie(movie[index].id);
    context.read<AddmovieCubit>().updateIsBookMark(
      isBookMark: true,
      movieId: movie[index].id,
    );
    context.read<GetMovieCubit>().getMoveToWatchList();
    //snack
    Snack.snack(
      context: context,
      textColor: AppColors.textPrimary,
      text: "Movie ${movie[index].title}  is Removed",
    );
  }
}
