import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies/features/home/data/models/movies_response_model.dart';
import 'package:movies/features/search/data/repo/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo searchRepo;
  SearchCubit(this.searchRepo) : super(SearchInitial());
  Future<void> searchMovies({required String name}) async {
    emit(SearchLoading());
    try {
      final responseModel = await searchRepo.searchMovies(name: name);
      emit(SearchSuccess(responseModel: responseModel));
    } catch (e) {
      emit(SearchFailure(errorMessage: e.toString()));
    }
  }
}
