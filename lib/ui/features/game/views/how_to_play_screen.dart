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
              "Matrix Puzzle is a deductive logic puzzle where you determine which resident lives on each floor of a building. Each puzzle features dynamic themes with different categories (such as Names, Pets, Hobbies, Drinks, Professions, Vehicles, Colors, Instruments, and Nationalities). Every floor has exactly one resident with one item from each category. Your goal is to deduce the full solution using the clues.",
              style: theme.textTheme.bodyMedium?.copyWith(height: 1.4, color: const Color(0xFFFFFFFF)),
            ),
            const SizedBox(height: 32),
            Text(
              "Clue Types & Meanings",
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF4FFBDF),
              ),
            ),
            const Divider(color: Color(0xFF4A4F6B)),
            const SizedBox(height: 16),
            _ClueSection(
              title: "1. Direct & Parity Clues",
              description: "These identify exact floor positions or numerical properties.",
              examples: const [
                _ExampleItem(
                  clue: "James lives on the 1st floor (Ground floor).",
                  meaning: "James is on Floor 1. Tap the Name cell on Floor 1 and select 'James'.",
                ),
                _ExampleItem(
                  clue: "The Doctor lives on an odd-numbered floor.",
                  meaning: "The Doctor can only live on Floor 1, 3, 5, 7, etc.",
                ),
              ],
            ),
            const SizedBox(height: 24),
            _ClueSection(
              title: "2. Association & Negative Clues",
              description: "These link or separate two characteristics belonging to residents.",
              examples: const [
                _ExampleItem(
                  clue: "Maria has a Cat.",
                  meaning: "Maria and Cat belong on the same floor.",
                ),
                _ExampleItem(
                  clue: "Chen does not drink Coffee.",
                  meaning: "Chen and Coffee cannot be on the same floor.",
                ),
              ],
            ),
            const SizedBox(height: 24),
            _ClueSection(
              title: "3. Neighbor & Relative Position",
              description: "These describe vertical positioning relationships between residents.",
              examples: const [
                _ExampleItem(
                  clue: "Yuki lives directly above Ahmed.",
                  meaning: "Yuki is on the immediate floor above Ahmed (Floor X + 1).",
                ),
                _ExampleItem(
                  clue: "Sofia lives on a floor adjacent to Dmitri.",
                  meaning: "Sofia lives either directly above or directly below Dmitri (|Floor A - Floor B| = 1).",
                ),
                _ExampleItem(
                  clue: "The Pilot lives somewhere above the Chef.",
                  meaning: "The Pilot lives on any higher floor than the Chef (Floor > X).",
                ),
              ],
            ),
            const SizedBox(height: 24),
            _ClueSection(
              title: "4. Distance & Betweenness Clues",
              description: "Advanced clues that specify relative gaps and sandwich arrangements.",
              examples: const [
                _ExampleItem(
                  clue: "Elena lives exactly 2 floors above Priya.",
                  meaning: "Elena's floor is exactly Priya's floor + 2 (e.g., Floors 1 and 3, or Floors 3 and 5).",
                ),
                _ExampleItem(
                  clue: "Chen lives on a floor between Maria and the Architect.",
                  meaning: "Chen's floor is strictly between Maria's floor and the Architect's floor.",
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              "Tools & Controls",
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF4FFBDF),
              ),
            ),
            const Divider(color: Color(0xFF4A4F6B)),
            const SizedBox(height: 16),
            _ClueSection(
              title: "Helpful Features",
              description: "Use these in-game tools to assist your deductions:",
              examples: const [
                _ExampleItem(
                  clue: "Hint Button (Above Grid)",
                  meaning: "Tap Hint and then tap any cell on the grid to reveal the correct value. You get 1 hint for 3-4 floor puzzles and 2 hints for 5+ floor puzzles.",
                ),
                _ExampleItem(
                  clue: "Undo Button (Above Grid)",
                  meaning: "Tap Undo to revert your last cell placement or hint action.",
                ),
                _ExampleItem(
                  clue: "Cross Out Clues",
                  meaning: "Tap any clue in the clue list to cross it out once you have applied its deduction.",
                ),
                _ExampleItem(
                  clue: "Notes FAB (Bottom Right)",
                  meaning: "Tap the floating notes button to write down your own scratchpad deductions.",
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
