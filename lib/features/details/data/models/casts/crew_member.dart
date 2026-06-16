class CrewMember {
  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;

  final String creditId;
  final String department;
  final String job;

  const CrewMember({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.creditId,
    required this.department,
    required this.job,
  });

  factory CrewMember.fromJson(Map<String, dynamic> json) {
    return CrewMember(
      adult: (json['adult'] as bool?) ?? false,
      gender: (json['gender'] as num?)?.toInt() ?? 0,
      id: (json['id'] as num).toInt(),
      knownForDepartment: (json['known_for_department'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      originalName: (json['original_name'] as String?) ?? '',
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
      profilePath: json['profile_path'] as String?,
      creditId: (json['credit_id'] as String?) ?? '',
      department: (json['department'] as String?) ?? '',
      job: (json['job'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'adult': adult,
    'gender': gender,
    'id': id,
    'known_for_department': knownForDepartment,
    'name': name,
    'original_name': originalName,
    'popularity': popularity,
    'profile_path': profilePath,
    'credit_id': creditId,
    'department': department,
    'job': job,
  };
}
