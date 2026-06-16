import 'package:movies/features/details/data/models/reviews/movie_model_rsponse_review.dart';

class MovieReviewsModel {
  final int id;
  final int page;
  final List<ReviewModelReview> results;
  final int totalPages;
  final int totalResults;

  MovieReviewsModel({
    required this.id,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieReviewsModel.fromJson(Map<String, dynamic> json) {
    return MovieReviewsModel(
      id: json['id'],
      page: json['page'],
      results: (json['results'] as List)
          .map((e) => ReviewModelReview.fromJson(e))
          .toList(),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}
