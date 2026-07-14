// ignore_for_file: unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies/features/details/data/models/reviews/collection_model.dart';
import 'package:movies/features/details/data/repos/reviews_repo.dart';

part 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  final ReviewsRepo reviewsRepo;
  ReviewCubit(this.reviewsRepo) : super(ReviewInitial());
  Future<void> getReview(int id) async {
    if (isClosed) return;
    emit(ReviewLoading());
    try {
      var responseModel = await reviewsRepo.getReview(id);
      if (isClosed) return;
      emit(ReviewSuccess(reviewsModel: responseModel));
    } catch (e) {
      if (isClosed) return;
      emit(ReviewFailure(errorMessage: e.toString()));
    }
  }
}
