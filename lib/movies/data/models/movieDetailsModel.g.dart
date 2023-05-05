// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movieDetailsModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDetailsModelAdapter extends TypeAdapter<MovieDetailsModel> {
  @override
  final int typeId = 0;

  @override
  MovieDetailsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDetailsModel(
      data: fields[0] as Data,
    );
  }

  @override
  void write(BinaryWriter writer, MovieDetailsModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DataAdapter extends TypeAdapter<Data> {
  @override
  final int typeId = 1;

  @override
  Data read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Data(
      movie: fields[0] as Movie,
    );
  }

  @override
  void write(BinaryWriter writer, Data obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.movie);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MovieAdapter extends TypeAdapter<Movie> {
  @override
  final int typeId = 2;

  @override
  Movie read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Movie(
      id: fields[0] as int,
      title: fields[1] as String,
      year: fields[2] as int,
      downloadCount: fields[3] as int,
      likeCount: fields[4] as int,
      descriptionIntro: fields[5] as String,
      cast: (fields[7] as List?)?.cast<Cast>(),
      largeCoverImage: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Movie obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.year)
      ..writeByte(3)
      ..write(obj.downloadCount)
      ..writeByte(4)
      ..write(obj.likeCount)
      ..writeByte(5)
      ..write(obj.descriptionIntro)
      ..writeByte(6)
      ..write(obj.largeCoverImage)
      ..writeByte(7)
      ..write(obj.cast);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CastAdapter extends TypeAdapter<Cast> {
  @override
  final int typeId = 3;

  @override
  Cast read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cast(
      name: fields[0] as String?,
      characterName: fields[1] as String?,
      urlSmallImage: fields[2] as String?,
      imdbCode: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Cast obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.characterName)
      ..writeByte(2)
      ..write(obj.urlSmallImage)
      ..writeByte(3)
      ..write(obj.imdbCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CastAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
