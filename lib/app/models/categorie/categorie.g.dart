// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categorie.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategorieAdapter extends TypeAdapter<Categorie> {
  @override
  final int typeId = 21;

  @override
  Categorie read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Categorie()
      ..id = fields[0] as int?
      ..nomAr = fields[1] as String?
      ..nomFr = fields[2] as String?
      ..image = fields[3] as String?
      ..children = (fields[4] as List?)?.cast<Categorie>()
      ..approved = fields[5] as int?;
  }

  @override
  void write(BinaryWriter writer, Categorie obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nomAr)
      ..writeByte(2)
      ..write(obj.nomFr)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.children)
      ..writeByte(5)
      ..write(obj.approved);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategorieAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
