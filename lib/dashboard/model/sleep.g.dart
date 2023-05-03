// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SleepAdapter extends TypeAdapter<Sleep> {
  @override
  final int typeId = 2;

  @override
  Sleep read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Sleep(
      date: fields[0] as DateTime,
      sleepDuration: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Sleep obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.sleepDuration);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SleepAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
