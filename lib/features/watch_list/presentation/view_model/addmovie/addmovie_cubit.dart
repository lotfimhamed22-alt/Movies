import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:movies/core/constants/hive_constats.dart';
import 'package:movies/features/watch_list/data/model/movie_model_watchlist.dart';

part 'addmovie_state.dart';

class AddmovieCubit extends Cubit<AddmovieState> {
  AddmovieCubit() : super(AddmovieInitial());
  final Box box = Hive.box(HiveConstats.hiveBox);
  bool isBookMark = true;
  // update isBookMark
  void updateIsBookMark(bool isBookMark) {
    this.isBookMark = isBookMark;
    emit(AddmovieInitial());
  }

  // add movie to watch list
  void addMovie({
    required int id,
    required String title,
    required String overview,
    required String posterPath,
    required String backdropPath,
    required String releaseDate,
    required double voteAverage,
    required int voteCount,
    required double popularity,
    required List<int> genreIds,
  }) {
    emit(AddmovieLoading());

    try {
      List<MovieModelWatchlist> movies = List.from(
        box.get(HiveConstats.boxList, defaultValue: []),
      ).cast<MovieModelWatchlist>();

      // التحقق من وجود الفيلم
      bool isExist = movies.any((movie) => movie.id == id);

      if (!isExist) {
        movies.add(
          MovieModelWatchlist(
            id: id,
            title: title,
            overview: overview,
            posterPath: posterPath,
            backdropPath: backdropPath,
            releaseDate: releaseDate,
            voteAverage: voteAverage,
            voteCount: voteCount,
            popularity: popularity,
            genreIds: genreIds,
          ),
        );

        box.put(HiveConstats.boxList, movies);
      }

      emit(AddmovieSuccess());
    } catch (e) {
      emit(AddmovieFailure(message: e.toString()));
    }
  }

  // save bookMark in hive box
  void saveDataInHive({required int movieId, required bool isBookMark}) {
    emit(AddmovieLoading());

    try {
      box.put(movieId, isBookMark);

      emit(AddmovieSuccess());
    } catch (e) {
      emit(AddmovieFailure(message: e.toString()));
    }
  }

  //
  bool isBookMarked(int movieId) {
    return box.get(movieId, defaultValue: false);
  }
}
