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
    r'd94eabab57831f8a4437a072b836e8635f3b7d65';

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
String _$gameRepositoryHash() => r'1bb5728b82e146ae5f2d8aa7c90209b8039dab9f';

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
String _$gameNotifierHash() => r'0ccef024f685384434ea112718a99a0fdaed8eb2';

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
