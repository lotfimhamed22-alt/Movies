import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:movies/core/constants/hive_constats.dart';
import 'package:movies/features/watch_list/data/model/movie_model_watchlist.dart';

part 'get_movie_state.dart';

class GetMovieCubit extends Cubit<GetMovieState> {
  GetMovieCubit() : super(GetMovieInitial());
  final Box box = Hive.box(HiveConstats.hiveBox);

  // get movie to watch list
  void getMoveToWatchList() {
    emit(GetMovieLoading());
    try {
      List<MovieModelWatchlist> movieToReturn = List.from(
        box.get(HiveConstats.boxList, defaultValue: []),
      ).cast<MovieModelWatchlist>();
      emit(GetMovieSuccess(movies: movieToReturn));
      print("get movie");
    } catch (e) {
      emit(GetMovieFailure(errorMessage: e.toString()));
    }
  }
}
