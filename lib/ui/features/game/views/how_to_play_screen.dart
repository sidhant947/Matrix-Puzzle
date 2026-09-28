import 'package:flutter/material.dart';
import 'package:matrixpuzzle/l10n/app_localizations.dart';

class HowToPlayScreen extends StatelessWidget {
  const HowToPlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.howToPlay),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l10n.objectiveTitle,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF4FFBDF),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.objectiveDescription,
              style: theme.textTheme.bodyMedium?.copyWith(height: 1.4, color: const Color(0xFFFFFFFF)),
            ),
            const SizedBox(height: 32),
            Text(
              l10n.clueTypesTitle,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF4FFBDF),
              ),
            ),
            const Divider(color: Color(0xFF4A4F6B)),
            const SizedBox(height: 16),
            _ClueSection(
              title: l10n.clueSectionDirectTitle,
              description: l10n.clueSectionDirectDesc,
              examples: [
                _ExampleItem(
                  clue: l10n.exampleDirectClue1,
                  meaning: l10n.exampleDirectMeaning1,
                ),
                _ExampleItem(
                  clue: l10n.exampleDirectClue2,
                  meaning: l10n.exampleDirectMeaning2,
                ),
              ],
            ),
            const SizedBox(height: 24),
            _ClueSection(
              title: l10n.clueSectionAssociationTitle,
              description: l10n.clueSectionAssociationDesc,
              examples: [
                _ExampleItem(
                  clue: l10n.exampleAssocClue1,
                  meaning: l10n.exampleAssocMeaning1,
                ),
                _ExampleItem(
                  clue: l10n.exampleAssocClue2,
                  meaning: l10n.exampleAssocMeaning2,
                ),
              ],
            ),
            const SizedBox(height: 24),
            _ClueSection(
              title: l10n.clueSectionNeighborTitle,
              description: l10n.clueSectionNeighborDesc,
              examples: [
                _ExampleItem(
                  clue: l10n.exampleNeighborClue1,
                  meaning: l10n.exampleNeighborMeaning1,
                ),
                _ExampleItem(
                  clue: l10n.exampleNeighborClue2,
                  meaning: l10n.exampleNeighborMeaning2,
                ),
                _ExampleItem(
                  clue: l10n.exampleNeighborClue3,
                  meaning: l10n.exampleNeighborMeaning3,
                ),
              ],
            ),
            const SizedBox(height: 24),
            _ClueSection(
              title: l10n.clueSectionDistanceTitle,
              description: l10n.clueSectionDistanceDesc,
              examples: [
                _ExampleItem(
                  clue: l10n.exampleDistanceClue1,
                  meaning: l10n.exampleDistanceMeaning1,
                ),
                _ExampleItem(
                  clue: l10n.exampleDistanceClue2,
                  meaning: l10n.exampleDistanceMeaning2,
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              l10n.toolsAndControlsTitle,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF4FFBDF),
              ),
            ),
            const Divider(color: Color(0xFF4A4F6B)),
            const SizedBox(height: 16),
            _ClueSection(
              title: l10n.helpfulFeaturesTitle,
              description: l10n.helpfulFeaturesDesc,
              examples: [
                _ExampleItem(
                  clue: l10n.toolHintTitle,
                  meaning: l10n.toolHintDesc,
                ),
                _ExampleItem(
                  clue: l10n.toolUndoTitle,
                  meaning: l10n.toolUndoDesc,
                ),
                _ExampleItem(
                  clue: l10n.toolCrossOutTitle,
                  meaning: l10n.toolCrossOutDesc,
                ),
                _ExampleItem(
                  clue: l10n.toolNotesTitle,
                  meaning: l10n.toolNotesDesc,
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _ClueSection extends StatelessWidget {
  final String title;
  final String description;
  final List<_ExampleItem> examples;

  const _ClueSection({
    required this.title,
    required this.description,
    required this.examples,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: const Color(0xFFFFFFFF),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: const Color(0xFFFFFFFF).withValues(alpha: 0.7),
            height: 1.4,
          ),
        ),
        const SizedBox(height: 16),
        ...examples,
      ],
    );
  }
}

class _ExampleItem extends StatelessWidget {
  final String clue;
  final String meaning;

  const _ExampleItem({
    required this.clue,
    required this.meaning,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF1E2030),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFF4A4F6B)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "\"$clue\"",
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color(0xFFFFFFFF),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              meaning,
              style: theme.textTheme.bodySmall?.copyWith(
                color: const Color(0xFF4FFBDF),
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
