part of 'delete_movie_cubit.dart';

@immutable
sealed class DeleteMovieState {}

final class DeleteMovieInitial extends DeleteMovieState {}

final class DeleteMovieLoading extends DeleteMovieState {}

final class DeleteMovieSuccess extends DeleteMovieState {}

final class DeleteMovieFailure extends DeleteMovieState {
  final String message;

  DeleteMovieFailure({required this.message});
}
