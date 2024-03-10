// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itemcartmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemCartModelAdapter extends TypeAdapter<ItemCartModel> {
  @override
  final int typeId = 0;

  @override
  ItemCartModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemCartModel(
      quantity: fields[0] as int,
      name: fields[1] as String,
      price: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, ItemCartModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.quantity)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemCartModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
