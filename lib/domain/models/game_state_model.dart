import 'package:hive/hive.dart';

part 'game_state_model.g.dart';

@HiveType(typeId: 3)
class GameStateModel extends HiveObject {
  @HiveField(0)
  final List<String> categories;

  @HiveField(1)
  final Map<String, List<String>> options;

  @HiveField(2)
  final List<String> clues;

  @HiveField(3)
  final Map<String, Map<String, String>> userSolution;

  @HiveField(4)
  final Map<String, Map<String, String>> actualSolution;

  @HiveField(5)
  final bool isVictory;

  @HiveField(6)
  final bool isLoading;

  @HiveField(7)
  final String gameType;

  @HiveField(8)
  final int? levelNumber;

  @HiveField(9)
  final String? dailyDate;

  @HiveField(10, defaultValue: <String>[])
  final List<String> crossedClues;

  @HiveField(11, defaultValue: '')
  final String notes;

  @HiveField(12, defaultValue: 0)
  final int hintsUsed;

  GameStateModel({
    required this.categories,
    required this.options,
    required this.clues,
    required this.userSolution,
    required this.actualSolution,
    this.isVictory = false,
    this.isLoading = false,
    this.gameType = 'practice',
    this.levelNumber,
    this.dailyDate,
    this.crossedClues = const [],
    this.notes = '',
    this.hintsUsed = 0,
  });

  int get maxHints {
    final floorsCount = options['Floor']?.length ?? 0;
    return floorsCount <= 4 ? 1 : 2;
  }

  int get hintsRemaining => (maxHints - hintsUsed).clamp(0, maxHints);

  bool get canUseHint => hintsRemaining > 0;

  GameStateModel copyWith({
    List<String>? categories,
    Map<String, List<String>>? options,
    List<String>? clues,
    Map<String, Map<String, String>>? userSolution,
    Map<String, Map<String, String>>? actualSolution,
    bool? isVictory,
    bool? isLoading,
    String? gameType,
    int? levelNumber,
    String? dailyDate,
    List<String>? crossedClues,
    String? notes,
    int? hintsUsed,
  }) {
    return GameStateModel(
      categories: categories ?? this.categories,
      options: options ?? this.options,
      clues: clues ?? this.clues,
      userSolution: userSolution ?? this.userSolution,
      actualSolution: actualSolution ?? this.actualSolution,
      isVictory: isVictory ?? this.isVictory,
      isLoading: isLoading ?? this.isLoading,
      gameType: gameType ?? this.gameType,
      levelNumber: levelNumber ?? this.levelNumber,
      dailyDate: dailyDate ?? this.dailyDate,
      crossedClues: crossedClues ?? this.crossedClues,
      notes: notes ?? this.notes,
      hintsUsed: hintsUsed ?? this.hintsUsed,
    );
  }
}
