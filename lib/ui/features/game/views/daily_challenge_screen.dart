import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../view_models/game_provider.dart';
import 'game_screen.dart';

class DailyChallengeScreen extends ConsumerWidget {
  const DailyChallengeScreen({super.key});

  String _getTodayDateString() {
    final now = DateTime.now();
    return "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
  }

  String _getFormattedDate(String dateStr) {
    final parts = dateStr.split('-');
    if (parts.length != 3) return dateStr;
    final year = parts[0];
    final month = int.tryParse(parts[1]) ?? 1;
    final day = parts[2];
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return "${months[month - 1]} $day, $year";
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final progress = ref.watch(userProgressProvider);
    final completedDailies = progress['completedDailies'] as List<String>? ?? [];
    final todayStr = _getTodayDateString();
    final isDailyCompleted = completedDailies.contains(todayStr);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Challenge'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              isDailyCompleted ? Icons.check_circle_outline : Icons.today,
              size: 100,
              color: isDailyCompleted ? Colors.green : theme.colorScheme.primary,
            ),
            const SizedBox(height: 24),
            Text(
              _getFormattedDate(todayStr),
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              isDailyCompleted
                  ? "You solved today's challenge! Come back tomorrow for a new one."
                  : "Solve today's puzzle. Same grid and clues for all players today.",
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6)),
            ),
            const SizedBox(height: 48),
            FilledButton.icon(
              onPressed: () {
                ref.read(gameNotifierProvider.notifier).startDailyChallenge(todayStr);
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const GameScreen()),
                );
              },
              icon: Icon(isDailyCompleted ? Icons.replay : Icons.play_arrow),
              label: Text(isDailyCompleted ? 'Replay Challenge' : 'Play Today\'s Riddle'),
            ),
          ],
        ),
      ),
    );
  }
}
