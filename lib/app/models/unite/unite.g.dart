// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unite.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UniteAdapter extends TypeAdapter<Unite> {
  @override
  final int typeId = 22;

  @override
  Unite read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Unite()
      ..id = fields[0] as int?
      ..nomAr = fields[1] as String?
      ..nomFr = fields[2] as String?
      ..abreviation = fields[3] as String?
      ..approved = fields[4] as int?;
  }

  @override
  void write(BinaryWriter writer, Unite obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nomAr)
      ..writeByte(2)
      ..write(obj.nomFr)
      ..writeByte(3)
      ..write(obj.abreviation)
      ..writeByte(4)
      ..write(obj.approved);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UniteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
