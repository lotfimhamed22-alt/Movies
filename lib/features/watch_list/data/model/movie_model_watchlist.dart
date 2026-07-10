import 'package:hive/hive.dart';
part 'movie_model_watchlist.g.dart';
@HiveType(typeId: 0)
class MovieModelWatchlist {

  @HiveField(0)
  final String title;
  @HiveField(1)
  final String overview;
  @HiveField(2)
  final String posterPath;
  @HiveField(3)
  final String backdropPath;
  @HiveField(4)
  final String releaseDate;
  @HiveField(5)
  final double voteAverage;
  @HiveField(6)
  final int voteCount;
  @HiveField(7)
  final double popularity;
  @HiveField(8)
  final List<int> genreIds;
  @HiveField(9)
  final int id;

  MovieModelWatchlist({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.popularity,
    required this.genreIds,
  });

  factory MovieModelWatchlist.fromJson(Map<String, dynamic> json) {
    return MovieModelWatchlist(
      id: json['id'],
      title: json['title'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      releaseDate: json['release_date'] ?? '',
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] ?? 0,
      popularity: (json['popularity'] as num).toDouble(),
      genreIds: List<int>.from(json['genre_ids'] ?? []),
    );
  }
}
