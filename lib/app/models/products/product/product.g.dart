// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 20;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product()
      ..codeBarre = fields[0] as String?
      ..nomFr = fields[1] as String?
      ..nomAr = fields[2] as String?
      ..reference = fields[3] as String?
      ..image = fields[4] as String?
      ..idCategorie = fields[5] as int?
      ..idUnite = fields[6] as int?;
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.codeBarre)
      ..writeByte(1)
      ..write(obj.nomFr)
      ..writeByte(2)
      ..write(obj.nomAr)
      ..writeByte(3)
      ..write(obj.reference)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.idCategorie)
      ..writeByte(6)
      ..write(obj.idUnite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
