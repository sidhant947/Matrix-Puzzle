// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matrix_puzzle_engine.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MatrixPuzzleEngineAdapter extends TypeAdapter<MatrixPuzzleEngine> {
  @override
  final int typeId = 0;

  @override
  MatrixPuzzleEngine read(BinaryReader reader) {
    return MatrixPuzzleEngine();
  }

  @override
  void write(BinaryWriter writer, MatrixPuzzleEngine obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MatrixPuzzleEngineAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ClueAdapter extends TypeAdapter<Clue> {
  @override
  final int typeId = 2;

  @override
  Clue read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Clue(
      fields[0] as String,
      (fields[2] as List).cast<String>(),
      fields[1] as ClueType,
    );
  }

  @override
  void write(BinaryWriter writer, Clue obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClueAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ClueTypeAdapter extends TypeAdapter<ClueType> {
  @override
  final int typeId = 1;

  @override
  ClueType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ClueType.sameFloor;
      case 1:
        return ClueType.floorBelow;
      case 2:
        return ClueType.floorAbove;
      case 3:
        return ClueType.fixedFloor;
      case 4:
        return ClueType.adjacentFloor;
      default:
        return ClueType.sameFloor;
    }
  }

  @override
  void write(BinaryWriter writer, ClueType obj) {
    switch (obj) {
      case ClueType.sameFloor:
        writer.writeByte(0);
        break;
      case ClueType.floorBelow:
        writer.writeByte(1);
        break;
      case ClueType.floorAbove:
        writer.writeByte(2);
        break;
      case ClueType.fixedFloor:
        writer.writeByte(3);
        break;
      case ClueType.adjacentFloor:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClueTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
