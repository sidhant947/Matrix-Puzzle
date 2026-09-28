import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../view_models/game_provider.dart';
import 'game_screen.dart';
import 'package:matrixpuzzle/l10n/app_localizations.dart';

class DailyChallengeScreen extends ConsumerWidget {
  const DailyChallengeScreen({super.key});

  String _getTodayDateString() {
    final now = DateTime.now();
    return "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
  }

  String _getFormattedDate(BuildContext context, String dateStr) {
    try {
      final dateTime = DateTime.parse(dateStr);
      final locale = Localizations.localeOf(context).toString();
      return DateFormat.yMMMMd(locale).format(dateTime);
    } catch (_) {
      return dateStr;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final progress = ref.watch(userProgressProvider);
    final completedDailies = progress['completedDailies'] as List<String>? ?? [];
    final todayStr = _getTodayDateString();
    final isDailyCompleted = completedDailies.contains(todayStr);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.dailyChallenge),
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
              _getFormattedDate(context, todayStr),
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              isDailyCompleted
                  ? l10n.dailyCompletedMessage
                  : l10n.dailyInstructionMessage,
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
              label: Text(isDailyCompleted ? l10n.replayChallenge : l10n.playTodayRiddle),
            ),
          ],
        ),
      ),
    );
  }
}
