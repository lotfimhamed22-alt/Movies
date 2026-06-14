import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movies/core/constants/api_constants.dart';
import 'package:movies/features/home/data/models/movies_response_model.dart';

part 'top_rated_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  TopRatedCubit() : super(TopRatedInitial());
  Future<void> getTopRatedMovies() async {
    emit(TopRatedLoading());

    try {
      print("sucess top rated");
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
      var response = MoviesResponseModel.fromJson(res.data);
      emit(TopRatedSuccess(responseModel: response));
    } catch (e) {
      emit(TopRatedFailure(errorMessage: e.toString()));
      print("fail top rated");
    }
  }
}
