// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'webtoon.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WebtoonAdapter extends TypeAdapter<Webtoon> {
  @override
  final int typeId = 1;

  @override
  Webtoon read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Webtoon(
      title: fields[0] as String,
      imageUrl: fields[1] as String,
      genre: fields[2] as String,
      description: fields[3] as String,
      creator: fields[4] as String,
      rating: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Webtoon obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.genre)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.creator)
      ..writeByte(5)
      ..write(obj.rating);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WebtoonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
