part of 'addmovie_cubit.dart';

@immutable
sealed class AddmovieState {}

final class AddmovieInitial extends AddmovieState {}

class UpdateBookMarkState extends AddmovieState {}

final class AddmovieLoading extends AddmovieState {}

final class AddmovieSuccess extends AddmovieState {}

final class AddmovieFailure extends AddmovieState {
  final String message;

  AddmovieFailure({required this.message});
}
