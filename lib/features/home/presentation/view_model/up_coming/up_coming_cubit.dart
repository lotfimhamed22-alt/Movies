import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movies/core/constants/api_constants.dart';
import 'package:movies/features/home/data/models/movies_response_model.dart';

part 'up_coming_state.dart';

class UpComingCubit extends Cubit<UpComingState> {
  UpComingCubit() : super(UpComingInitial());
  Future<void> getUpComingMovies() async {
    emit(UpComingLoading());
    try {
      final dio = Dio();
      final res = await dio.get(
        ApiConstants.upComingPath,
        options: Options(
          headers: {
            ApiConstants.authorization: ApiConstants.authorizationPath,
            ApiConstants.accept: ApiConstants.acceptPath,
          },
        ),
      );
      var response = MoviesResponseModel.fromJson(res.data);
      emit(UpComingSuccess(responseModel: response));
    } catch (e) {
      emit(UpComingFailure(errorMessage: e.toString()));
    }
  }
}
