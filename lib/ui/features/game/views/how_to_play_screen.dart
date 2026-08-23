import 'package:flutter/material.dart';

class HowToPlayScreen extends StatelessWidget {
  const HowToPlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('How To Play'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Objective",
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF4FFBDF),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Matrix Puzzle is a logic puzzle where you must determine which person lives on each floor of a building. You are given clues about Names, Nationalities, and Professions. Each floor has exactly one person. Your goal is to match all people to their correct floors.",
              style: theme.textTheme.bodyMedium?.copyWith(height: 1.4, color: const Color(0xFFFFFFFF)),
            ),
            const SizedBox(height: 32),
            Text(
              "How to Solve",
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF4FFBDF),
              ),
            ),
            const Divider(color: Color(0xFF4A4F6B)),
            const SizedBox(height: 16),
            _ClueSection(
              title: "1. Direct Clues",
              description: "These tell you exactly which floor someone lives on.",
              examples: const [
                _ExampleItem(
                  clue: "James lives on the 1st floor.",
                  meaning: "James is on Floor 1. Tap the Name cell on Floor 1 and select 'James'.",
                ),
                _ExampleItem(
                  clue: "The American person lives on the 3rd floor.",
                  meaning: "The American person is on Floor 3.",
                ),
              ],
            ),
            const SizedBox(height: 24),
            _ClueSection(
              title: "2. Matching Clues",
              description: "These link two characteristics to the same person.",
              examples: const [
                _ExampleItem(
                  clue: "Maria is Brazilian.",
                  meaning: "Maria is Brazilian. Both go on the same floor.",
                ),
                _ExampleItem(
                  clue: "Chen is an Engineer.",
                  meaning: "Chen works as an Engineer.",
                ),
              ],
            ),
            const SizedBox(height: 24),
            _ClueSection(
              title: "3. Vertical Clues",
              description: "These describe vertical relationships between floors.",
              examples: const [
                _ExampleItem(
                  clue: "Yuki lives directly above Ahmed.",
                  meaning: "Yuki is on the immediate floor above Ahmed (Floor X+1).",
                ),
                _ExampleItem(
                  clue: "Sofia lives somewhere below Dmitri.",
                  meaning: "Sofia is on a lower floor than Dmitri (Floor < X).",
                ),
                _ExampleItem(
                  clue: "The Pilot lives somewhere above the Chef.",
                  meaning: "The Pilot is on a higher floor than the Chef (Floor > X).",
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              "Tips",
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF4FFBDF),
              ),
            ),
            const Divider(color: Color(0xFF4A4F6B)),
            const SizedBox(height: 16),
            Text(
              "Start with direct clues to anchor known values. Then use matching clues to fill in same-floor pairs. Finally, use vertical clues to connect the remaining floors. Tap crossed clues to mark them as used.",
              style: theme.textTheme.bodyMedium?.copyWith(height: 1.4, color: const Color(0xFFFFFFFF)),
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
