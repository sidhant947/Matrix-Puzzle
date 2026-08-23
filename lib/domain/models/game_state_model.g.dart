// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameStateModelAdapter extends TypeAdapter<GameStateModel> {
  @override
  final int typeId = 3;

  @override
  GameStateModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GameStateModel(
      categories: (fields[0] as List).cast<String>(),
      options: (fields[1] as Map).map((dynamic k, dynamic v) =>
          MapEntry(k as String, (v as List).cast<String>())),
      clues: (fields[2] as List).cast<String>(),
      userSolution: (fields[3] as Map).map((dynamic k, dynamic v) =>
          MapEntry(k as String, (v as Map).cast<String, String>())),
      actualSolution: (fields[4] as Map).map((dynamic k, dynamic v) =>
          MapEntry(k as String, (v as Map).cast<String, String>())),
      isVictory: fields[5] as bool,
      isLoading: fields[6] as bool,
      gameType: fields[7] as String,
      levelNumber: fields[8] as int?,
      dailyDate: fields[9] as String?,
      crossedClues:
          fields[10] == null ? [] : (fields[10] as List).cast<String>(),
      notes: fields[11] == null ? '' : fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GameStateModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.categories)
      ..writeByte(1)
      ..write(obj.options)
      ..writeByte(2)
      ..write(obj.clues)
      ..writeByte(3)
      ..write(obj.userSolution)
      ..writeByte(4)
      ..write(obj.actualSolution)
      ..writeByte(5)
      ..write(obj.isVictory)
      ..writeByte(6)
      ..write(obj.isLoading)
      ..writeByte(7)
      ..write(obj.gameType)
      ..writeByte(8)
      ..write(obj.levelNumber)
      ..writeByte(9)
      ..write(obj.dailyDate)
      ..writeByte(10)
      ..write(obj.crossedClues)
      ..writeByte(11)
      ..write(obj.notes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameStateModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
