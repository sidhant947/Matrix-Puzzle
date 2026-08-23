import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../view_models/game_provider.dart';
import 'game_screen.dart';

class LevelsScreen extends ConsumerWidget {
  const LevelsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final progress = ref.watch(userProgressProvider);
    final currentLevel = progress['currentLevel'] as int? ?? 1;
    final completedLevels = progress['completedLevels'] as List<int>? ?? [];

    final clearedCount = completedLevels.length;
    final extraBlocks = clearedCount ~/ 12;
    final maxLevelsToShow = 20 + extraBlocks * 12;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Levels'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: maxLevelsToShow,
        itemBuilder: (context, index) {
          final level = index + 1;
          final isCompleted = completedLevels.contains(level);
          final isUnlocked = level <= currentLevel || isCompleted;
          final cardColor = isCompleted
              ? const Color(0xFF1E2030)
              : isUnlocked
                  ? const Color(0xFF1E2030)
                  : const Color(0xFF1E2030).withValues(alpha: 0.4);

          return Card(
            clipBehavior: Clip.antiAlias,
            color: cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: isCompleted
                    ? const Color(0xFF4FFBDF)
                    : (isUnlocked ? const Color(0xFF4A4F6B) : Colors.transparent),
                width: isCompleted ? 1.5 : 1,
              ),
            ),
            child: InkWell(
              onTap: isUnlocked
                  ? () {
                      ref.read(gameNotifierProvider.notifier).startNewLevel(level);
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const GameScreen()),
                      );
                    }
                  : null,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (!isUnlocked)
                      const Icon(
                        Icons.lock,
                        color: Color(0xFF4A4F6B),
                      )
                    else ...[
                      if (isCompleted)
                        const Icon(
                          Icons.check_circle,
                          size: 16,
                          color: Color(0xFF4FFBDF),
                        ),
                      const SizedBox(height: 4),
                      Text(
                        '$level',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                    ]
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
