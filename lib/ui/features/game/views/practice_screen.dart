import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../view_models/game_provider.dart';
import 'game_screen.dart';
import 'package:matrixpuzzle/l10n/app_localizations.dart';

class PracticeScreen extends ConsumerStatefulWidget {
  const PracticeScreen({super.key});

  @override
  ConsumerState<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends ConsumerState<PracticeScreen> {
  int _floorsCount = 4;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.randomPuzzle),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l10n.customizeBuildingSize,
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Text(l10n.floorsSliderLabel(_floorsCount)),
            Slider(
              value: _floorsCount.toDouble(),
              min: 3,
              max: 10,
              divisions: 7,
              label: "$_floorsCount",
              onChanged: (val) {
                setState(() {
                  _floorsCount = val.round();
                });
              },
            ),
            const SizedBox(height: 48),
            FilledButton(
              onPressed: () {
                ref.read(gameNotifierProvider.notifier).startPracticeGame(
                      floorsCount: _floorsCount,
                    );
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const GameScreen()),
                );
              },
              child: Text(l10n.generatePracticeBuilding),
            ),
          ],
        ),
      ),
    );
  }
}
