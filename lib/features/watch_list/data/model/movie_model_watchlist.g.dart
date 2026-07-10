// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model_watchlist.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieModelWatchlistAdapter extends TypeAdapter<MovieModelWatchlist> {
  @override
  final int typeId = 0;

  @override
  MovieModelWatchlist read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieModelWatchlist(
      id: fields[9] as int,
      title: fields[0] as String,
      overview: fields[1] as String,
      posterPath: fields[2] as String,
      backdropPath: fields[3] as String,
      releaseDate: fields[4] as String,
      voteAverage: fields[5] as double,
      voteCount: fields[6] as int,
      popularity: fields[7] as double,
      genreIds: (fields[8] as List).cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, MovieModelWatchlist obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.overview)
      ..writeByte(2)
      ..write(obj.posterPath)
      ..writeByte(3)
      ..write(obj.backdropPath)
      ..writeByte(4)
      ..write(obj.releaseDate)
      ..writeByte(5)
      ..write(obj.voteAverage)
      ..writeByte(6)
      ..write(obj.voteCount)
      ..writeByte(7)
      ..write(obj.popularity)
      ..writeByte(8)
      ..write(obj.genreIds)
      ..writeByte(9)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieModelWatchlistAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
