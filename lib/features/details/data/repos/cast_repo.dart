import 'package:dio/dio.dart';
import 'package:movies/core/constants/api_constants.dart';
import 'package:movies/features/details/data/models/casts/movie_credits_response.dart';

class CastRepo {
  Future<MovieCreditsResponse> getCatData(int movieId) async {
    var dio = Dio();
    var res = await dio.get(
      'https://api.themoviedb.org/3/movie/$movieId/credits?language=en-US',

      options: Options(
        headers: {
          ApiConstants.authorization: ApiConstants.authorizationPath,
          ApiConstants.accept: ApiConstants.acceptPath,
        },
      ),
    );
    return MovieCreditsResponse.fromJson(res.data);
  }
}
