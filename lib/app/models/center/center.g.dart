// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'center.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CentreAdapter extends TypeAdapter<Centre> {
  @override
  final int typeId = 13;

  @override
  Centre read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Centre()
      ..code = fields[0] as String?
      ..name = fields[1] as String?
      ..address = fields[2] as String?
      ..phone = fields[3] as String?
      ..latitude = fields[4] as String?
      ..longitude = fields[5] as String?
      ..lastCheck = fields[6] as DateTime?;
  }

  @override
  void write(BinaryWriter writer, Centre obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.address)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.latitude)
      ..writeByte(5)
      ..write(obj.longitude)
      ..writeByte(6)
      ..write(obj.lastCheck);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CentreAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
