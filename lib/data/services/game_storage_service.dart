import 'package:hive/hive.dart';
import '../../domain/models/game_state_model.dart';
import '../../domain/models/matrix_puzzle_engine.dart';

class GameStorageService {
  static const String _boxName = 'game_state_box';
  static const String _stateKey = 'current_state';

  Future<void> init() async {
    Hive.registerAdapter(MatrixPuzzleEngineAdapter());
    Hive.registerAdapter(ClueTypeAdapter());
    Hive.registerAdapter(ClueAdapter());
    Hive.registerAdapter(GameStateModelAdapter());
    await Hive.openBox<GameStateModel>(_boxName);
    await Hive.openBox('game_progress_box');
  }

  Box<GameStateModel> get _box => Hive.box<GameStateModel>(_boxName);
  Box get _progressBox => Hive.box('game_progress_box');

  Future<void> saveGameState(GameStateModel state) async {
    await _box.put(_stateKey, state);
  }

  GameStateModel? getGameState() {
    return _box.get(_stateKey);
  }

  Future<void> clearGameState() async {
    await _box.delete(_stateKey);
  }

  int getCurrentLevel() {
    return _progressBox.get('current_level', defaultValue: 1) as int;
  }

  Future<void> setCurrentLevel(int level) async {
    await _progressBox.put('current_level', level);
  }

  List<int> getCompletedLevels() {
    final list = _progressBox.get('completed_levels', defaultValue: <int>[]) as List;
    return list.cast<int>();
  }

  Future<void> markLevelCompleted(int level) async {
    final completed = getCompletedLevels();
    if (!completed.contains(level)) {
      completed.add(level);
      await _progressBox.put('completed_levels', completed);
    }
  }

  List<String> getCompletedDailies() {
    final list = _progressBox.get('completed_dailies', defaultValue: <String>[]) as List;
    return list.cast<String>();
  }

  Future<void> markDailyCompleted(String date) async {
    final completed = getCompletedDailies();
    if (!completed.contains(date)) {
      completed.add(date);
      await _progressBox.put('completed_dailies', completed);
    }
  }

  bool getMoveCrossedCluesToBottom() {
    return _progressBox.get('move_crossed_clues_to_bottom', defaultValue: true) as bool;
  }

  Future<void> setMoveCrossedCluesToBottom(bool value) async {
    await _progressBox.put('move_crossed_clues_to_bottom', value);
  }

  bool getAutoCheckSolution() {
    return _progressBox.get('auto_check_solution', defaultValue: false) as bool;
  }

  Future<void> setAutoCheckSolution(bool value) async {
    await _progressBox.put('auto_check_solution', value);
  }
}
