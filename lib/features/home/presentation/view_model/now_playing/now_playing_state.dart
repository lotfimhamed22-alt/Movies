part of 'now_playing_cubit.dart';

@immutable
sealed class NowPlayingState {}

final class NowPlayingInitial extends NowPlayingState {}

final class NowPlayingLoading extends NowPlayingState {}

final class NowPlayingSuccess extends NowPlayingState {
  final MoviesResponseModel response;

  NowPlayingSuccess({required this.response});
}

final class NowPlayingFailure extends NowPlayingState {
  final String errorMessage;

  NowPlayingFailure({required this.errorMessage});
}
