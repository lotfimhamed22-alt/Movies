import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies/features/details/data/models/casts/movie_credits_response.dart';
import 'package:movies/features/details/data/repos/cast_repo.dart';

part 'cast_state.dart';

class CastCubit extends Cubit<CastState> {
  final CastRepo castRepo;
  CastCubit(this.castRepo) : super(CastInitial());
  Future<void> getCatData(int movieId) async {
    try {
      emit(CastLoading());
      var data = await castRepo.getCatData(movieId);
      emit(CastSuccess(response: data));
      print("success");
    } catch (e) {
      emit(CastFailure(errorMessage: e.toString()));
      print("fail");
    }
  }
}
