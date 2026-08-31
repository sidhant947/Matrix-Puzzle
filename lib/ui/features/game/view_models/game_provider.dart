import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:matrixpuzzle/data/repositories/game_repository.dart';
import 'package:matrixpuzzle/data/services/game_storage_service.dart';
import 'package:matrixpuzzle/domain/models/matrix_puzzle_engine.dart';
import 'package:matrixpuzzle/domain/models/game_state_model.dart';

part 'game_provider.g.dart';

@riverpod
GameStorageService gameStorageService(GameStorageServiceRef ref) {
  throw UnimplementedError('Initialize gameStorageService in main');
}

@riverpod
MatrixPuzzleEngine matrixPuzzleEngine(MatrixPuzzleEngineRef ref) {
  return MatrixPuzzleEngine();
}

@riverpod
GameRepository gameRepository(GameRepositoryRef ref) {
  final storage = ref.watch(gameStorageServiceProvider);
  final engine = ref.watch(matrixPuzzleEngineProvider);
  return GameRepository(storageService: storage, engine: engine);
}

@riverpod
class GameNotifier extends _$GameNotifier {
  final List<Map<String, Map<String, String>>> _history = [];

  @override
  GameStateModel build() {
    final repo = ref.watch(gameRepositoryProvider);
    return repo.loadOrGenerateGame();
  }

  void startNewGame() {
    _history.clear();
    state = state.copyWith(isLoading: true);
    final repo = ref.read(gameRepositoryProvider);
    state = repo.startNewGame();
  }

  void startNewLevel(int levelNumber) {
    _history.clear();
    state = state.copyWith(isLoading: true);
    final repo = ref.read(gameRepositoryProvider);
    state = repo.startNewLevel(levelNumber);
  }

  void startDailyChallenge(String date) {
    _history.clear();
    state = state.copyWith(isLoading: true);
    final repo = ref.read(gameRepositoryProvider);
    state = repo.startDailyChallenge(date);
  }

  void startPracticeGame({int floorsCount = 5}) {
    _history.clear();
    state = state.copyWith(isLoading: true);
    final repo = ref.read(gameRepositoryProvider);
    state = repo.startNewGame(floorsCount: floorsCount);
  }

  void updateAssignment(String floor, String category, String value) {
    if (state.isVictory) return;

    final previousSolution = Map<String, Map<String, String>>.from(
      state.userSolution.map((k, v) => MapEntry(k, Map<String, String>.from(v)))
    );

    final newUserSolution = Map<String, Map<String, String>>.from(
      state.userSolution.map((k, v) => MapEntry(k, Map<String, String>.from(v)))
    );
    if (value != '-') {
      for (var otherFloor in newUserSolution.keys) {
        if (otherFloor != floor && newUserSolution[otherFloor]?[category] == value) {
          newUserSolution[otherFloor]![category] = '-';
        }
      }
    }
    newUserSolution[floor]![category] = value;

    _history.add(previousSolution);

    final repo = ref.read(gameRepositoryProvider);
    var updatedState = state.copyWith(userSolution: newUserSolution);

    state = updatedState;
    repo.saveGame(state);

    final settings = ref.read(settingsNotifierProvider);
    if (settings.autoCheckSolution) {
      checkSolution();
    }
  }

  void applyHint(String floor, String category) {
    if (state.isVictory || !state.canUseHint) return;
    final value = state.actualSolution[floor]?[category];
    if (value == null) return;

    final previousSolution = Map<String, Map<String, String>>.from(
      state.userSolution.map((k, v) => MapEntry(k, Map<String, String>.from(v)))
    );

    final newUserSolution = Map<String, Map<String, String>>.from(
      state.userSolution.map((k, v) => MapEntry(k, Map<String, String>.from(v)))
    );
    for (var otherFloor in newUserSolution.keys) {
      if (otherFloor != floor && newUserSolution[otherFloor]?[category] == value) {
        newUserSolution[otherFloor]![category] = '-';
      }
    }
    newUserSolution[floor]![category] = value;

    _history.add(previousSolution);

    final repo = ref.read(gameRepositoryProvider);
    var updatedState = state.copyWith(
      userSolution: newUserSolution,
      hintsUsed: state.hintsUsed + 1,
    );

    state = updatedState;
    repo.saveGame(state);

    final settings = ref.read(settingsNotifierProvider);
    if (settings.autoCheckSolution) {
      checkSolution();
    }
  }

  void undo() {
    if (state.isVictory || _history.isEmpty) return;

    final previousSolution = _history.removeLast();
    final repo = ref.read(gameRepositoryProvider);
    final updatedState = state.copyWith(userSolution: previousSolution);

    state = updatedState;
    repo.saveGame(state);
  }

  bool get canUndo => _history.isNotEmpty;

  void toggleClueCrossed(String clue) {
    if (state.isVictory) return;

    final crossed = List<String>.from(state.crossedClues);
    if (crossed.contains(clue)) {
      crossed.remove(clue);
    } else {
      crossed.add(clue);
    }

    final repo = ref.read(gameRepositoryProvider);
    final updatedState = state.copyWith(crossedClues: crossed);
    state = updatedState;
    repo.saveGame(state);
  }

  void clearCrossedClues() {
    if (state.crossedClues.isEmpty) return;

    final repo = ref.read(gameRepositoryProvider);
    final updatedState = state.copyWith(crossedClues: const []);
    state = updatedState;
    repo.saveGame(state);
  }

  void updateNotes(String notes) {
    if (state.notes == notes) return;

    final repo = ref.read(gameRepositoryProvider);
    final updatedState = state.copyWith(notes: notes);
    state = updatedState;
    repo.saveGame(state);
  }

  bool checkSolution() {
    final repo = ref.read(gameRepositoryProvider);
    if (repo.verifyVictory(state)) {
      var updatedState = state.copyWith(isVictory: true);
      if (updatedState.gameType == 'level' && updatedState.levelNumber != null) {
        repo.storageService.markLevelCompleted(updatedState.levelNumber!);
        final currentL = repo.storageService.getCurrentLevel();
        if (updatedState.levelNumber == currentL) {
          repo.storageService.setCurrentLevel(currentL + 1);
        }
      } else if (updatedState.gameType == 'daily' && updatedState.dailyDate != null) {
        repo.storageService.markDailyCompleted(updatedState.dailyDate!);
      }
      state = updatedState;
      repo.saveGame(state);
      return true;
    }
    return false;
  }
}

class SettingsState {
  final bool moveCrossedCluesToBottom;
  final bool autoCheckSolution;

  const SettingsState({
    this.moveCrossedCluesToBottom = true,
    this.autoCheckSolution = false,
  });

  SettingsState copyWith({
    bool? moveCrossedCluesToBottom,
    bool? autoCheckSolution,
  }) {
    return SettingsState(
      moveCrossedCluesToBottom: moveCrossedCluesToBottom ?? this.moveCrossedCluesToBottom,
      autoCheckSolution: autoCheckSolution ?? this.autoCheckSolution,
    );
  }
}

@riverpod
class SettingsNotifier extends _$SettingsNotifier {
  @override
  SettingsState build() {
    final storage = ref.watch(gameStorageServiceProvider);
    return SettingsState(
      moveCrossedCluesToBottom: storage.getMoveCrossedCluesToBottom(),
      autoCheckSolution: storage.getAutoCheckSolution(),
    );
  }

  Future<void> setMoveCrossedCluesToBottom(bool value) async {
    final storage = ref.read(gameStorageServiceProvider);
    await storage.setMoveCrossedCluesToBottom(value);
    state = state.copyWith(moveCrossedCluesToBottom: value);
  }

  Future<void> setAutoCheckSolution(bool value) async {
    final storage = ref.read(gameStorageServiceProvider);
    await storage.setAutoCheckSolution(value);
    state = state.copyWith(autoCheckSolution: value);
  }
}

@riverpod
Map<String, dynamic> userProgress(UserProgressRef ref) {
  final repo = ref.watch(gameRepositoryProvider);
  ref.watch(gameNotifierProvider);
  return {
    'currentLevel': repo.storageService.getCurrentLevel(),
    'completedLevels': repo.storageService.getCompletedLevels(),
    'completedDailies': repo.storageService.getCompletedDailies(),
  };
}
