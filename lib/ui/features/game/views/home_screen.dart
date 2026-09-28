import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../view_models/game_provider.dart';
import 'game_screen.dart';
import 'levels_screen.dart';
import 'how_to_play_screen.dart';
import 'settings_screen.dart';
import 'package:matrixpuzzle/l10n/app_localizations.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String _getTodayDateString() {
    final now = DateTime.now();
    return "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
  }

  void _showDifficultyDialog(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final tiers = [
      (l10n.difficultyEasy, 3),
      (l10n.difficultyMedium, 5),
      (l10n.difficultyHard, 7),
      (l10n.difficultyExpert, 10),
    ];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(l10n.selectDifficulty),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: tiers.map((entry) {
              return ListTile(
                title: Text(entry.$1),
                subtitle: Text(
                  l10n.floorsCount(entry.$2),
                ),
                onTap: () {
                  Navigator.pop(context);
                  ref
                      .read(gameNotifierProvider.notifier)
                      .startPracticeGame(
                        floorsCount: entry.$2,
                      );
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (_) => const GameScreen()));
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final progress = ref.watch(userProgressProvider);
    final currentLevel = progress['currentLevel'] as int? ?? 1;
    final todayStr = _getTodayDateString();
    final gameState = ref.watch(gameNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.star, color: Color(0xFF4FFBDF)),
          onPressed: () async {
            final url = Uri.parse(
              'https://github.com/sidhant947/Matrix-Puzzle',
            );
            try {
              await launchUrl(url, mode: LaunchMode.externalApplication);
            } catch (_) {
              await launchUrl(url, mode: LaunchMode.platformDefault);
            }
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.redAccent),
            onPressed: () async {
              final url = Uri.parse('https://ko-fi.com/sidhant947');
              try {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              } catch (_) {
                await launchUrl(url, mode: LaunchMode.platformDefault);
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Column(
            children: [
              const Spacer(),
              const SizedBox(height: 24),
              Text(
                l10n.appTitle,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.appSubtitle,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
              const Spacer(),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FilledButton(
                    onPressed: () {
                      if (gameState.gameType != 'level' ||
                          gameState.levelNumber != currentLevel) {
                        ref
                            .read(gameNotifierProvider.notifier)
                            .startNewLevel(currentLevel);
                      }
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const GameScreen()),
                      );
                    },
                    style: FilledButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: Text(l10n.play),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton(
                    onPressed: () {
                      if (gameState.gameType != 'daily' ||
                          gameState.dailyDate != todayStr) {
                        ref
                            .read(gameNotifierProvider.notifier)
                            .startDailyChallenge(todayStr);
                      }
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const GameScreen()),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: Text(l10n.dailyChallenge),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const LevelsScreen()),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: Text(l10n.levels),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton(
                    onPressed: () => _showDifficultyDialog(context, ref),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: Text(l10n.randomPuzzle),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const HowToPlayScreen(),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: Text(l10n.howToPlay),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const SettingsScreen(),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: Text(l10n.settings),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
