import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies/features/home/data/models/movies_response_model.dart';
import 'package:movies/features/home/data/repos/top_rated_repo.dart';

part 'top_rated_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  final TopRatedRepo topRatedRepo;
  TopRatedCubit(this.topRatedRepo) : super(TopRatedInitial());
  Future<void> getTopRatedMovies() async {
    if (isClosed) return;

    emit(TopRatedLoading());

    try {
      print("sucess top rated");

      var response = await topRatedRepo.getTopRatedMovies();
      if (isClosed) return;

      emit(TopRatedSuccess(responseModel: response));
    } catch (e) {
      if (isClosed) return;

      emit(TopRatedFailure(errorMessage: e.toString()));
      print("fail top rated");
    }
  }
}
