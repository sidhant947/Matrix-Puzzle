import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../view_models/game_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsNotifierProvider);
    final notifier = ref.read(settingsNotifierProvider.notifier);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
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
              'Move Crossed Clues to Bottom',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              'When enabled, clues crossed off will move to the bottom of the list',
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
              'Auto Check Solution',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              'Automatically verify and complete the puzzle when correct, removing the Check Solution button',
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
