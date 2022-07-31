// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CourseAdapter extends TypeAdapter<Course> {
  @override
  final int typeId = 0;

  @override
  Course read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Course()
      ..date = fields[0] as DateTime?
      ..distance = fields[1] as double
      ..duration = fields[2] as String?
      ..speed = fields[3] as double
      ..calories = fields[4] as double
      ..seance = fields[5] as Seance?;
  }

  @override
  void write(BinaryWriter writer, Course obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.distance)
      ..writeByte(2)
      ..write(obj.duration)
      ..writeByte(3)
      ..write(obj.speed)
      ..writeByte(4)
      ..write(obj.calories)
      ..writeByte(5)
      ..write(obj.seance);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
