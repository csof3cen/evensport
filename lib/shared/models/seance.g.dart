// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seance.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SeanceAdapter extends TypeAdapter<Seance> {
  @override
  final int typeId = 1;

  @override
  Seance read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Seance()
      ..dayInWeek = fields[0] as int
      ..type = fields[1] as String
      ..date = fields[2] as DateTime?;
  }

  @override
  void write(BinaryWriter writer, Seance obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.dayInWeek)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeanceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
