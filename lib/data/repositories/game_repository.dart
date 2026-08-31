import '../../domain/models/game_state_model.dart';
import '../../domain/models/matrix_puzzle_engine.dart';
import '../services/game_storage_service.dart';

class GameRepository {
  final GameStorageService storageService;
  final MatrixPuzzleEngine engine;

  GameRepository({
    required this.storageService,
    required this.engine,
  });

  GameStateModel loadOrGenerateGame() {
    final cached = storageService.getGameState();
    if (cached != null &&
        cached.options.containsKey('Floor') &&
        cached.categories.contains('Name')) {
      return cached;
    }
    storageService.clearGameState();
    return startNewGame();
  }

  GameStateModel startNewGame({int floorsCount = 5}) {
    final puzzle = engine.generatePuzzle(floorsCount: floorsCount);
    final floors = puzzle['options']['Floor'] as List<String>;

    Map<String, Map<String, String>> userSolution = {};
    for (var floor in floors) {
      userSolution[floor] = {};
    }

    final newState = GameStateModel(
      categories: List<String>.from(puzzle['categories']),
      options: Map<String, List<String>>.from(puzzle['options']),
      clues: List<String>.from(puzzle['clues']),
      userSolution: userSolution,
      actualSolution: Map<String, Map<String, String>>.from(puzzle['solution']),
      gameType: 'practice',
    );

    storageService.saveGameState(newState);
    return newState;
  }

  GameStateModel startNewLevel(int level) {
    final floorsCount = _getFloorsForLevel(level);
    final seed = level * 1000 + 123;
    final puzzle = engine.generatePuzzle(
      floorsCount: floorsCount,
      seed: seed,
      levelNumber: level,
    );
    final floors = puzzle['options']['Floor'] as List<String>;

    Map<String, Map<String, String>> userSolution = {};
    for (var floor in floors) {
      userSolution[floor] = {};
    }

    final newState = GameStateModel(
      categories: List<String>.from(puzzle['categories']),
      options: Map<String, List<String>>.from(puzzle['options']),
      clues: List<String>.from(puzzle['clues']),
      userSolution: userSolution,
      actualSolution: Map<String, Map<String, String>>.from(puzzle['solution']),
      gameType: 'level',
      levelNumber: level,
    );

    storageService.saveGameState(newState);
    return newState;
  }

  GameStateModel startDailyChallenge(String date) {
    final parts = date.split('-');
    final year = int.tryParse(parts[0]) ?? 2026;
    final month = int.tryParse(parts[1]) ?? 1;
    final day = int.tryParse(parts[2]) ?? 1;
    final seed = year * 10000 + month * 100 + day;

    final puzzle = engine.generatePuzzle(
      floorsCount: 5,
      seed: seed,
    );
    final floors = puzzle['options']['Floor'] as List<String>;

    Map<String, Map<String, String>> userSolution = {};
    for (var floor in floors) {
      userSolution[floor] = {};
    }

    final newState = GameStateModel(
      categories: List<String>.from(puzzle['categories']),
      options: Map<String, List<String>>.from(puzzle['options']),
      clues: List<String>.from(puzzle['clues']),
      userSolution: userSolution,
      actualSolution: Map<String, Map<String, String>>.from(puzzle['solution']),
      gameType: 'daily',
      dailyDate: date,
    );

    storageService.saveGameState(newState);
    return newState;
  }

  int _getFloorsForLevel(int level) {
    if (level <= 5) return 3;
    if (level <= 15) return 4;
    if (level <= 25) return 5;
    if (level <= 40) return 6;
    if (level <= 55) return 7;
    if (level <= 70) return 8;
    if (level <= 85) return 9;
    return 10;
  }

  Future<void> saveGame(GameStateModel state) async {
    await storageService.saveGameState(state);
  }

  bool verifyVictory(GameStateModel state) {
    return engine.checkVictory(state.userSolution, state.actualSolution);
  }
}
