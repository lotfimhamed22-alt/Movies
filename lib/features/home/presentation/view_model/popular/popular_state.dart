part of 'popular_cubit.dart';

@immutable
sealed class PopularState {}

final class PopularInitial extends PopularState {}

final class PopularLoading extends PopularState {}

final class PopularSuccess extends PopularState {
  final MoviesResponseModel responseModel;

  PopularSuccess({required this.responseModel});
}

final class PopularFailure extends PopularState {
  final String errorMessage;

  PopularFailure({required this.errorMessage});
}
