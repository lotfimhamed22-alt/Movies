import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/core/constants/app_constants.dart';
import 'package:movies/core/constants/asset_constants.dart';
import 'package:movies/core/constants/routes_constants.dart';
import 'package:movies/core/customs/custom_app_bar.dart';
import 'package:movies/core/customs/custom_clip_rrect.dart';
import 'package:movies/core/customs/custom_text.dart';
import 'package:movies/core/customs/custom_textfield.dart';
import 'package:movies/core/responsive/extentions.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/features/search/presentation/model_view/search/search_cubit.dart';
import 'package:movies/features/search/presentation/view/customs/custom_row_search.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: AppConstants.search,
        icon: Icons.error_outline,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Gap(2.h),
            CustomTextfield(
              onChanged: (value) {
                if (value.trim().isNotEmpty) {
                  context.read<SearchCubit>().searchMovies(name: value);
                } else {
                  setState(() {});
                }
              },
              readOnly: false,
              controller: _searchController,
            ),
            // listview builder
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (_searchController.text.isEmpty) {
                  return Column(
                    children: [
                      Gap(155.h),
                      Image.asset(
                        AssetConstants.gifAsset,
                        width: 260.w,
                        fit: BoxFit.cover,
                      ),
                      CustomText(
                        text: AppConstants.enterMovieName,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ],
                  );
                }

                if (state is SearchLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.textPrimary,
                    ),
                  );
                }

                if (state is SearchSuccess) {
                  if (state.responseModel.results.isEmpty) {
                    return Column(
                      children: [
                        Gap(230.h),
                        Image.asset(AssetConstants.searchAsset, width: 70.w),
                        Gap(30.h),
                        CustomText(
                          text: AppConstants.noMovies,
                          color: AppColors.textPrimary,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        Gap(10.h),
                        CustomText(
                          text: AppConstants.searchNow,
                          color: AppColors.textSecondary,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    );
                  }
                  return SizedBox(
                    height: 713.h,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: state.responseModel.results.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 160.h,
                                width: 125.w,
                                child: GestureDetector(
                                  onTap: () => context.push(
                                    RoutesConstants.detailsPath,
                                    extra: state.responseModel.results[index],
                                  ),
                                  child: CustomClipRrect(
                                    imgPath:
                                        'https://image.tmdb.org/t/p/w500${state.responseModel.results[index].posterPath}',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                ),
                                child: SizedBox(
                                  width: 350.w,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: state
                                            .responseModel
                                            .results[index]
                                            .title,
                                        color: AppColors.textPrimary,
                                        fontSize: 22.sp,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Gap(20.h),
                                      CustomRowDetailsMovieSearch(
                                        text: state
                                            .responseModel
                                            .results[index]
                                            .voteAverage
                                            .toString(),
                                        icon: Icons.star_border,
                                        iconColor: AppColors.warning,
                                        textColor: AppColors.warning,
                                      ),
                                      Gap(5.h),
                                      CustomRowDetailsMovieSearch(
                                        text: state
                                            .responseModel
                                            .results[index]
                                            .voteCount
                                            .toString(),
                                        icon: Icons.bookmark_outline,
                                        iconColor: AppColors.textSecondary,
                                        textColor: AppColors.textSecondary,
                                      ),
                                      Gap(5.h),
                                      CustomRowDetailsMovieSearch(
                                        text: state
                                            .responseModel
                                            .results[index]
                                            .popularity
                                            .toString(),
                                        icon: Icons.local_movies,
                                        iconColor: AppColors.textSecondary,
                                        textColor: AppColors.textSecondary,
                                      ),
                                      Gap(5.h),
                                      CustomRowDetailsMovieSearch(
                                        text: state
                                            .responseModel
                                            .results[index]
                                            .releaseDate
                                            .toString(),
                                        icon: Icons.calendar_today,
                                        iconColor: AppColors.textSecondary,
                                        textColor: AppColors.textSecondary,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
                return SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
