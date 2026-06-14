part of 'top_rated_cubit.dart';

@immutable
sealed class TopRatedState {}

final class TopRatedInitial extends TopRatedState {}

final class TopRatedLoading extends TopRatedState {}

final class TopRatedSuccess extends TopRatedState {
  final MoviesResponseModel responseModel;

  TopRatedSuccess({required this.responseModel});
}

final class TopRatedFailure extends TopRatedState {
  final String errorMessage;

  TopRatedFailure({required this.errorMessage});
}
