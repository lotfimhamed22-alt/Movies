import 'package:dio/dio.dart';
import 'package:movies/core/constants/api_constants.dart';
import 'package:movies/features/details/data/models/reviews/collection_model.dart';

class ReviewsRepo {
  Future<MovieReviewsModel> getReview(int id) async {
    var dio = Dio();
    var response = await dio.get(
      "https://api.themoviedb.org/3/movie/$id/reviews?language=en-US&page=1",
      options: Options(
        headers: {
          ApiConstants.authorization: ApiConstants.authorizationPath,
          ApiConstants.accept: ApiConstants.acceptPath,
        },
      ),
    );
    return MovieReviewsModel.fromJson(response.data);
  }
}
