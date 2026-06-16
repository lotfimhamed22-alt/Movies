import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movies/core/constants/api_constants.dart';
import 'package:movies/features/details/data/models/casts/movie_credits_response.dart';

part 'cast_state.dart';

class CastCubit extends Cubit<CastState> {
  CastCubit() : super(CastInitial());
  Future<void> getCatData(int movieId) async {
    try {
      emit(CastLoading());
      print("success");
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
      var data = MovieCreditsResponse.fromJson(res.data);
      emit(CastSuccess(response: data));
      print("success");
    } catch (e) {
      emit(CastFailure(errorMessage: e.toString()));
      print("fail");
    }
  }
}
