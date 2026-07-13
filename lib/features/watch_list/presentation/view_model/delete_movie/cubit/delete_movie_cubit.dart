import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:movies/core/constants/hive_constats.dart';
import 'package:movies/features/watch_list/data/model/movie_model_watchlist.dart';

part 'delete_movie_state.dart';

class DeleteMovieCubit extends Cubit<DeleteMovieState> {
  DeleteMovieCubit() : super(DeleteMovieInitial());
  // get box
  final Box box = Hive.box(HiveConstats.hiveBox);

  // remove movie
  void removeMovie(int id) {
    emit(DeleteMovieLoading());
    try {
      List<MovieModelWatchlist> movieToDelete = List.from(
        box.get(HiveConstats.boxList, defaultValue: []),
      ).cast<MovieModelWatchlist>();

      // remove
      movieToDelete.removeWhere((element) => element.id == id); // put

      box.put(HiveConstats.boxList, movieToDelete);
      emit(DeleteMovieSuccess());
      // emit(DeleteMovieInitial());
    } catch (e) {
      emit(DeleteMovieFailure(message: e.toString()));
    }
  }
}
