import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movies/core/constants/api_constants.dart';
import 'package:movies/features/home/data/models/movies_response_model.dart';

part 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit() : super(NowPlayingInitial());

  Future<void> getNowPlayingMovies() async {
    emit(NowPlayingLoading());
    print("loading");
    try {
      final dio = Dio();
      final res = await dio.get(
        ApiConstants.nowPlayingPath,
        options: Options(
          headers: {
            ApiConstants.authorization: ApiConstants.authorizationPath,
            ApiConstants.accept: ApiConstants.acceptPath,
          },
        ),
      );
      print("success");
      var response = MoviesResponseModel.fromJson(res.data);
      emit(NowPlayingSuccess(response: response));
    } catch (e) {
      emit(NowPlayingFailure(errorMessage: e.toString()));
      print("failure");
    }
  }
}
