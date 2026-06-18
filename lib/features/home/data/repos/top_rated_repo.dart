import 'package:dio/dio.dart';
import 'package:movies/core/constants/api_constants.dart';
import 'package:movies/features/home/data/models/movies_response_model.dart';

class TopRatedRepo {
  Future<MoviesResponseModel> getTopRatedMovies() async {
    final dio = Dio();
    final res = await dio.get(
      ApiConstants.topRatedPath,
      options: Options(
        headers: {
          ApiConstants.authorization: ApiConstants.authorizationPath,
          ApiConstants.accept: ApiConstants.acceptPath,
        },
      ),
    );
    return MoviesResponseModel.fromJson(res.data);
  }
}
