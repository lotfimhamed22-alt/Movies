// ignore_for_file: unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movies/core/constants/api_constants.dart';
import 'package:movies/features/details/data/models/reviews/collection_model.dart';

part 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit() : super(ReviewInitial());
  Future<void> getReview(int id) async {
    emit(ReviewLoading());
    try {
      final dio = Dio();
      final response = await dio.get(
        "https://api.themoviedb.org/3/movie/$id/reviews?language=en-US&page=1",
        options: Options(
          headers: {
            ApiConstants.authorization: ApiConstants.authorizationPath,
            ApiConstants.accept: ApiConstants.acceptPath,
          },
        ),
      );

      var responseModel = MovieReviewsModel.fromJson(response.data);
      emit(ReviewSuccess(reviewsModel: responseModel));
    } catch (e) {
      emit(ReviewFailure(errorMessage: e.toString()));
    }
  }
}
