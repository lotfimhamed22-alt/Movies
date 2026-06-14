import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movies/core/constants/api_constants.dart';
import 'package:movies/features/home/data/models/movies_response_model.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit() : super(PopularInitial());
  Future<void> getPopularMovies() async {
    emit(PopularLoading());
    try {
      final dio = Dio();
      final res = await dio.get(
        ApiConstants.popularPath,
        options: Options(
          headers: {
            ApiConstants.authorization: ApiConstants.authorizationPath,
            ApiConstants.accept: ApiConstants.acceptPath,
          },
        ),
      );
      var response = MoviesResponseModel.fromJson(res.data);
      emit(PopularSuccess(responseModel: response));
    } catch (e) {
      emit(PopularFailure(errorMessage: e.toString()));
    }
  }
}
