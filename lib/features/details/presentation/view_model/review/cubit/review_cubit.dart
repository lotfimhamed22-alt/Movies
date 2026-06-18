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
    emit(ReviewLoading());
    try {
      var responseModel = await reviewsRepo.getReview(id);
      emit(ReviewSuccess(reviewsModel: responseModel));
    } catch (e) {
      emit(ReviewFailure(errorMessage: e.toString()));
    }
  }
}
