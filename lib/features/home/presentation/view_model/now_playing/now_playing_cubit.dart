import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies/features/home/data/models/movies_response_model.dart';
import 'package:movies/features/home/data/repos/now_playing_repo.dart';

part 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  final NowPlayingRepo nowPlayingRepo;
  NowPlayingCubit(this.nowPlayingRepo) : super(NowPlayingInitial());

  Future<void> getNowPlayingMovies() async {
    if (isClosed) return;

    emit(NowPlayingLoading());
    print("loading");
    try {
      print("success");
      var response = await nowPlayingRepo.getNowPlayingMovies();
      if (isClosed) return;
      emit(NowPlayingSuccess(response: response));
    } catch (e) {
      if (isClosed) return;
      emit(NowPlayingFailure(errorMessage: e.toString()));
      print("failure");
    }
  }
}
