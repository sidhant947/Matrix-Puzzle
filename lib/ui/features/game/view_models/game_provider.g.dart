// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gameStorageServiceHash() =>
    r'0657d3206d6de399fb9437f9ee1d11fc063fbef1';

/// See also [gameStorageService].
@ProviderFor(gameStorageService)
final gameStorageServiceProvider =
    AutoDisposeProvider<GameStorageService>.internal(
  gameStorageService,
  name: r'gameStorageServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gameStorageServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GameStorageServiceRef = AutoDisposeProviderRef<GameStorageService>;
String _$matrixPuzzleEngineHash() =>
    r'7e3502173f931fb34f10fb6f8e33140ed7c06c9a';

/// See also [matrixPuzzleEngine].
@ProviderFor(matrixPuzzleEngine)
final matrixPuzzleEngineProvider =
    AutoDisposeProvider<MatrixPuzzleEngine>.internal(
  matrixPuzzleEngine,
  name: r'matrixPuzzleEngineProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$matrixPuzzleEngineHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MatrixPuzzleEngineRef = AutoDisposeProviderRef<MatrixPuzzleEngine>;
String _$gameRepositoryHash() => r'aa272a764dc82330d324ce93c84ea5893f3c8a44';

/// See also [gameRepository].
@ProviderFor(gameRepository)
final gameRepositoryProvider = AutoDisposeProvider<GameRepository>.internal(
  gameRepository,
  name: r'gameRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gameRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GameRepositoryRef = AutoDisposeProviderRef<GameRepository>;
String _$userProgressHash() => r'6561f18e7c2e68ca83a5624a85edc51e07650654';

/// See also [userProgress].
@ProviderFor(userProgress)
final userProgressProvider = AutoDisposeProvider<Map<String, dynamic>>.internal(
  userProgress,
  name: r'userProgressProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userProgressHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserProgressRef = AutoDisposeProviderRef<Map<String, dynamic>>;
String _$gameNotifierHash() => r'e7f76e212b2e62ec65e809c8afdb731c9eda83a8';

/// See also [GameNotifier].
@ProviderFor(GameNotifier)
final gameNotifierProvider =
    AutoDisposeNotifierProvider<GameNotifier, GameStateModel>.internal(
  GameNotifier.new,
  name: r'gameNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$gameNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GameNotifier = AutoDisposeNotifier<GameStateModel>;
String _$settingsNotifierHash() => r'9c3f2d5a49f6f744cd0bf1f1e555e40cdf174317';

/// See also [SettingsNotifier].
@ProviderFor(SettingsNotifier)
final settingsNotifierProvider =
    AutoDisposeNotifierProvider<SettingsNotifier, SettingsState>.internal(
  SettingsNotifier.new,
  name: r'settingsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$settingsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SettingsNotifier = AutoDisposeNotifier<SettingsState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
