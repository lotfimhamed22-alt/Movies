import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies/features/home/data/models/movies_response_model.dart';
import 'package:movies/features/home/data/repos/popular_repo.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  final PopularRepo popularRepo;
  PopularCubit(this.popularRepo) : super(PopularInitial());
  Future<void> getPopularMovies() async {
    emit(PopularLoading());
    try {
      var response = await popularRepo.getPopularMovies();
      emit(PopularSuccess(responseModel: response));
    } catch (e) {
      emit(PopularFailure(errorMessage: e.toString()));
    }
  }
}
