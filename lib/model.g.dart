// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class Model1Adapter extends TypeAdapter<Model1> {
  @override
  final int typeId = 0;

  @override
  Model1 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Model1(
      id: fields[0] as int?,
      list: (fields[1] as HiveList?)?.castHiveList(),
    );
  }

  @override
  void write(BinaryWriter writer, Model1 obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.list);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Model1Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class Model2Adapter extends TypeAdapter<Model2> {
  @override
  final int typeId = 1;

  @override
  Model2 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Model2(
      id: fields[0] as int?,
      name: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Model2 obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Model2Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
