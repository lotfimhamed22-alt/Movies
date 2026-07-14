import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies/features/home/data/models/movies_response_model.dart';
import 'package:movies/features/home/data/repos/popular_repo.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  final PopularRepo popularRepo;
  PopularCubit(this.popularRepo) : super(PopularInitial());
  Future<void> getPopularMovies() async {
    if (isClosed) return;

    emit(PopularLoading());
    try {
      var response = await popularRepo.getPopularMovies();
      if (isClosed) return;

      emit(PopularSuccess(responseModel: response));
    } catch (e) {
      if (isClosed) return;

      emit(PopularFailure(errorMessage: e.toString()));
    }
  }
}
