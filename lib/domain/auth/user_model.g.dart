// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 1;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      status: fields[0] as String,
      message: fields[1] as String,
      mobNo: fields[2] as String,
      userName: fields[3] as String,
      custId: fields[4] as String,
      email: fields[5] as String,
      userToken: fields[6] as String,
      addressList: (fields[7] as List).cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.mobNo)
      ..writeByte(3)
      ..write(obj.userName)
      ..writeByte(4)
      ..write(obj.custId)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.userToken)
      ..writeByte(7)
      ..write(obj.addressList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
