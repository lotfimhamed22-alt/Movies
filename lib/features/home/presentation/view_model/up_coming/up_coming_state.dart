part of 'up_coming_cubit.dart';

@immutable
sealed class UpComingState {}

final class UpComingInitial extends UpComingState {}

final class UpComingLoading extends UpComingState {}

final class UpComingSuccess extends UpComingState {
  final MoviesResponseModel responseModel;

  UpComingSuccess({required this.responseModel});
}

final class UpComingFailure extends UpComingState {
  final String errorMessage;

  UpComingFailure({required this.errorMessage});
}
