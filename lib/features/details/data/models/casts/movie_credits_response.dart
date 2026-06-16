import 'package:movies/features/details/data/models/casts/cast_member.dart';
import 'package:movies/features/details/data/models/casts/crew_member.dart';

class MovieCreditsResponse {
  final int id;
  final List<CastMember> cast;
  final List<CrewMember> crew;

  const MovieCreditsResponse({
    required this.id,
    required this.cast,
    required this.crew,
  });

  factory MovieCreditsResponse.fromJson(Map<String, dynamic> json) {
    return MovieCreditsResponse(
      id: (json['id'] as num).toInt(),
      cast: (json['cast'] as List<dynamic>? ?? const [])
          .map((e) => CastMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      crew: (json['crew'] as List<dynamic>? ?? const [])
          .map((e) => CrewMember.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'cast': cast.map((e) => e.toJson()).toList(),
    'crew': crew.map((e) => e.toJson()).toList(),
  };
}
