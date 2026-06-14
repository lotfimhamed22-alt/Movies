import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'top_rated_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  TopRatedCubit() : super(TopRatedInitial());
}
