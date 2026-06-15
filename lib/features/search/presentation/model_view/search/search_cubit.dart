import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movies/core/constants/api_constants.dart';
import 'package:movies/features/home/data/models/movies_response_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  Future<void> searchMovies({required String name}) async {
    emit(SearchLoading());
    try {
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
      final responseModel = MoviesResponseModel.fromJson(response.data);
      emit(SearchSuccess(responseModel: responseModel));
    } catch (e) {
      emit(SearchFailure(errorMessage: e.toString()));
    }
  }
}
