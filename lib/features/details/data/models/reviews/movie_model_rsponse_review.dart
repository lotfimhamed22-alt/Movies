import 'package:movies/features/details/data/models/reviews/author_details_model.dart';

class ReviewModelReview {
  final String author;
  final AuthorDetailsModel authorDetails;
  final String content;
  final String createdAt;
  final String id;
  final String updatedAt;
  final String url;

  ReviewModelReview({
    required this.author,
    required this.authorDetails,
    required this.content,
    required this.createdAt,
    required this.id,
    required this.updatedAt,
    required this.url,
  });

  factory ReviewModelReview.fromJson(Map<String, dynamic> json) {
    return ReviewModelReview(
      author: json['author'] ?? '',
      authorDetails: AuthorDetailsModel.fromJson(json['author_details']),
      content: json['content'] ?? '',
      createdAt: json['created_at'] ?? '',
      id: json['id'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      url: json['url'] ?? '',
    );
  }
}
