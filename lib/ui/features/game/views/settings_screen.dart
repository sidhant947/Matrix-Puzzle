import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../view_models/game_provider.dart';
import 'package:matrixpuzzle/l10n/app_localizations.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsNotifierProvider);
    final notifier = ref.read(settingsNotifierProvider.notifier);
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settings),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        children: [
          SwitchListTile(
            value: settings.moveCrossedCluesToBottom,
            onChanged: (value) {
              notifier.setMoveCrossedCluesToBottom(value);
            },
            title: Text(
              l10n.moveCrossedCluesToBottomTitle,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              l10n.moveCrossedCluesToBottomSubtitle,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.65),
              ),
            ),
            activeThumbColor: const Color(0xFF4FFBDF),
            contentPadding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          ),
          const Divider(color: Color(0xFF4A4F6B)),
          SwitchListTile(
            value: settings.autoCheckSolution,
            onChanged: (value) {
              notifier.setAutoCheckSolution(value);
            },
            title: Text(
              l10n.autoCheckSolutionTitle,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              l10n.autoCheckSolutionSubtitle,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.65),
              ),
            ),
            activeThumbColor: const Color(0xFF4FFBDF),
            contentPadding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          ),
        ],
      ),
    );
  }
}
