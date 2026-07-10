part of 'get_movie_cubit.dart';

@immutable
sealed class GetMovieState {}

final class GetMovieInitial extends GetMovieState {}

final class GetMovieLoading extends GetMovieState {}

final class GetMovieSuccess extends GetMovieState {
  final List<MovieModelWatchlist> movies;

  GetMovieSuccess({required this.movies});
}

final class GetMovieFailure extends GetMovieState {
  final String errorMessage;

  GetMovieFailure({required this.errorMessage});
}
