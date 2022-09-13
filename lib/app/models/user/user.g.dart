// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 9;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User()
      ..frFullName = fields[0] as String?
      ..arFullName = fields[1] as String?
      ..userPercentage = fields[2] as String?
      ..firstNameAr = fields[3] as String?
      ..status = fields[4] as String?
      ..statusAr = fields[5] as String?
      ..birthDate = fields[6] as String?
      ..statusDate = fields[7] as String?
      ..totalFamilyMembers = fields[9] as int?
      ..totalSickLeaves = fields[10] as int?
      ..totalPrescriptions = fields[11] as int?
      ..totalOnlineRequests = fields[12] as int?
      ..center = fields[13] as String?
      ..address = fields[14] as String?
      ..situationFam = fields[15] as String?
      ..noAssure = fields[16] as String?
      ..phone = fields[17] as String?
      ..email = fields[18] as String?
      ..hasQrCode = fields[19] as String?
      ..position = fields[20] as String?
      ..centre = fields[21] as Centre?
      ..lastNameAr = fields[22] as String?
      ..lastName = fields[23] as String?
      ..firstName = fields[24] as String?
      ..numserie = fields[25] as String?
      ..possedeDemandeCarteChifa = fields[26] as int?;
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(26)
      ..writeByte(0)
      ..write(obj.frFullName)
      ..writeByte(1)
      ..write(obj.arFullName)
      ..writeByte(2)
      ..write(obj.userPercentage)
      ..writeByte(3)
      ..write(obj.firstNameAr)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.statusAr)
      ..writeByte(6)
      ..write(obj.birthDate)
      ..writeByte(7)
      ..write(obj.statusDate)
      ..writeByte(9)
      ..write(obj.totalFamilyMembers)
      ..writeByte(10)
      ..write(obj.totalSickLeaves)
      ..writeByte(11)
      ..write(obj.totalPrescriptions)
      ..writeByte(12)
      ..write(obj.totalOnlineRequests)
      ..writeByte(13)
      ..write(obj.center)
      ..writeByte(14)
      ..write(obj.address)
      ..writeByte(15)
      ..write(obj.situationFam)
      ..writeByte(16)
      ..write(obj.noAssure)
      ..writeByte(17)
      ..write(obj.phone)
      ..writeByte(18)
      ..write(obj.email)
      ..writeByte(19)
      ..write(obj.hasQrCode)
      ..writeByte(20)
      ..write(obj.position)
      ..writeByte(21)
      ..write(obj.centre)
      ..writeByte(22)
      ..write(obj.lastNameAr)
      ..writeByte(23)
      ..write(obj.lastName)
      ..writeByte(24)
      ..write(obj.firstName)
      ..writeByte(25)
      ..write(obj.numserie)
      ..writeByte(26)
      ..write(obj.possedeDemandeCarteChifa);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
