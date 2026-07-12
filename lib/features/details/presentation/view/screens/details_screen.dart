import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:movies/core/constants/app_constants.dart';
import 'package:movies/core/customs/custom_app_bar.dart';
import 'package:movies/core/customs/custom_clip_rrect.dart';
import 'package:movies/core/customs/custom_text.dart';
import 'package:movies/core/responsive/extentions.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/features/details/presentation/view/customs/custom_about_movie.dart';
import 'package:movies/features/details/presentation/view/customs/custom_cast.dart';
import 'package:movies/features/details/presentation/view/customs/custom_review.dart';
import 'package:movies/features/details/presentation/view/customs/details_about_movie.dart';
import 'package:movies/features/details/presentation/view_model/cast/cubit/cast_cubit.dart';
import 'package:movies/features/details/presentation/view_model/review/cubit/review_cubit.dart';
import 'package:movies/features/home/data/models/movie_model.dart';
import 'package:movies/features/search/presentation/view/customs/custom_row_search.dart';
import 'package:movies/features/watch_list/presentation/view_model/addmovie/addmovie_cubit.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.data});
  final MovieModel data;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ReviewCubit>().getReview(widget.data.id);
    context.read<CastCubit>().getCatData(widget.data.id);
    context.read<AddmovieCubit>().isBookMarked(widget.data.id);
  }

  // bool isClick = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddmovieCubit, AddmovieState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            onTap: () {
              // 1. جلب الحالة الحالية للمتغير من الـ Cubit وعكسها مباشرة عند الضغط
              bool currentStatus = context.read<AddmovieCubit>().isBookMark;
              bool newStatus = !currentStatus;
              // 2. تحديث قيمة الـ Cubit بالوضع الجديد فوراً ليتحول شكل الأيقونة في الـ UI
              context.read<AddmovieCubit>().updateIsBookMark(newStatus);

              print(widget.data.id);
              // 3. اتخاذ القرار بناءً على الوضع الجديد
              if (newStatus == false) {
                // إذا أصبحت true، نقوم بإضافة الفيلم
                print("تمت الإضافة للبوك مارك");
                context.read<AddmovieCubit>().addMovie(
                  id: widget.data.id,
                  title: widget.data.title,
                  overview: widget.data.overview,
                  posterPath: widget.data.posterPath,
                  backdropPath: widget.data.backdropPath,
                  releaseDate: widget.data.releaseDate,
                  voteAverage: widget.data.voteAverage,
                  voteCount: widget.data.voteCount,
                  popularity: widget.data.popularity,
                  genreIds: widget.data.genreIds,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: CustomText(text: "Movie is Added")),
                );
                //
                final cubit = context.read<AddmovieCubit>();

                final current = cubit.isBookMarked(widget.data.id);

                cubit.saveDataInHive(
                  movieId: widget.data.id,
                  isBookMark: current,
                );
                //
              } else {
                // إذا أصبحت false، (إختياري) يمكنك استدعاء ميثود حذف الفيلم هنا لو متوفرة
                print("تم الحذف من البوك مارك");
                // context.read<AddmovieCubit>().deleteMovie(widget.data.id);
              }
            },
            text: AppConstants.details,
            icon:
                true ==
                    context
                        .read<AddmovieCubit>()
                        .isBookMark // true == false  // false false // true false
                ? Icons.bookmark_outline
                : Icons.bookmark,
          ),
          body: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                SizedBox(
                  height: 400.h,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      CustomClipRrect(
                        height: 300.h,
                        width: double.infinity,
                        imgPath:
                            'https://image.tmdb.org/t/p/w500${widget.data.posterPath}',
                      ),
                      Positioned(
                        bottom: 0.h,
                        left: 20.w,
                        child: CustomClipRrect(
                          width: 150.w,
                          height: 210.h,
                          imgPath:
                              'https://image.tmdb.org/t/p/w500${widget.data.backdropPath}',
                        ),
                      ),
                      Positioned(
                        bottom: 120.h,
                        right: 10.w,
                        // bottom: 30,
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: AppColors.circleColor,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: CustomRowDetailsMovieSearch(
                            text: widget.data.voteAverage.toString(),
                            textColor: AppColors.warning,
                            iconColor: AppColors.warning,
                            icon: Icons.star_outline_rounded,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 40.h,
                        left: 185.w,
                        child: CustomText(
                          text: widget.data.title,
                          color: AppColors.textPrimary,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                // row
                Gap(15.h),
                DetailsAboutMovie(
                  text1: widget.data.voteAverage.toString(),
                  text2: widget.data.voteCount.toString(),
                  text3: widget.data.popularity.toString(),
                  text4: widget.data.releaseDate,
                ),
                Gap(5.h),
                // tab bar
                TabBar(
                  labelColor: AppColors.textPrimary,
                  unselectedLabelColor: AppColors.myBlue,
                  indicatorColor: AppColors.success,
                  dividerColor: AppColors.searchColor,

                  tabs: [
                    Tab(
                      child: CustomText(
                        text: AppConstants.aboutMovie,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Tab(
                      child: CustomText(
                        text: AppConstants.reviews,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Tab(
                      child: CustomText(
                        text: AppConstants.cast,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      CustomAboutMovie(text: widget.data.overview),
                      CustomReview(),
                      CustomCast(),
                    ],
                  ),
                ),
                // details
              ],
            ),
          ),
        );
      },
    );
  }
}
