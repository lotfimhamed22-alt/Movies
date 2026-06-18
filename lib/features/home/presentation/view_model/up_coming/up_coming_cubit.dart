import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies/features/home/data/models/movies_response_model.dart';
import 'package:movies/features/home/data/repos/up_coming_repo.dart';

part 'up_coming_state.dart';

class UpComingCubit extends Cubit<UpComingState> {
  final UpComingRepo upComingRepo;
  UpComingCubit(this.upComingRepo) : super(UpComingInitial());
  Future<void> getUpComingMovies() async {
    emit(UpComingLoading());
    try {
      var response = await upComingRepo.getUpComingMovies();
      emit(UpComingSuccess(responseModel: response));
    } catch (e) {
      emit(UpComingFailure(errorMessage: e.toString()));
    }
  }
}
