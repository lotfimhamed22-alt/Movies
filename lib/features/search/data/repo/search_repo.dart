import 'package:dio/dio.dart';
import 'package:movies/core/constants/api_constants.dart';
import 'package:movies/features/home/data/models/movies_response_model.dart';

class SearchRepo {
  Future<MoviesResponseModel> searchMovies({required String name}) async {
    final dio = Dio();
    final response = await dio.get(
      "https://api.themoviedb.org/3/search/movie?query=$name&include_adult=false&language=en-US&page=1",
      options: Options(
        headers: {
          ApiConstants.authorization: ApiConstants.authorizationPath,
          ApiConstants.accept: ApiConstants.acceptPath,
        },
      ),
    );
    return MoviesResponseModel.fromJson(response.data);
  }
}
