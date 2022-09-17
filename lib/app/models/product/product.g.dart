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
      ..id = fields[0] as int?
      ..codeBarre = fields[1] as String?
      ..nomFr = fields[2] as String?
      ..nomAr = fields[3] as String?
      ..reference = fields[4] as String?
      ..image = fields[5] as String?
      ..categorie = fields[6] as Categorie?
      ..unite = fields[7] as Unite?;
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.codeBarre)
      ..writeByte(2)
      ..write(obj.nomFr)
      ..writeByte(3)
      ..write(obj.nomAr)
      ..writeByte(4)
      ..write(obj.reference)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.categorie)
      ..writeByte(7)
      ..write(obj.unite);
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
