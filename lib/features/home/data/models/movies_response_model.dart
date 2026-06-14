import 'package:movies/features/home/data/models/movie_model.dart';

class MoviesResponseModel {
  final int page;
  final int totalPages;
  final int totalResult;
  final List<MovieModel> results;

  MoviesResponseModel({
    required this.page,
    required this.totalPages,
    required this.totalResult,
    required this.results,
  });

  factory MoviesResponseModel.fromJson(Map<String, dynamic> json) {
    return MoviesResponseModel(
      page: json["page"],
      totalPages: json["total_pages"],
      totalResult: json["total_results"],
      results: (json['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList(),
    );
  }
}
