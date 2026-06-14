import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'up_coming_state.dart';

class UpComingCubit extends Cubit<UpComingState> {
  UpComingCubit() : super(UpComingInitial());
}
