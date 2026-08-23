import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../domain/models/game_state_model.dart';
import '../view_models/game_provider.dart';

class GameScreen extends ConsumerStatefulWidget {
  const GameScreen({super.key});

  @override
  ConsumerState<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen> {
  bool _showNotes = false;
  late final TextEditingController _notesController;

  @override
  void initState() {
    super.initState();
    _notesController = TextEditingController(text: ref.read(gameNotifierProvider).notes);
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(gameNotifierProvider, (previous, next) {
      if (previous?.levelNumber != next.levelNumber ||
          previous?.dailyDate != next.dailyDate ||
          previous?.gameType != next.gameType ||
          previous?.actualSolution != next.actualSolution) {
        setState(() {
          _notesController.text = next.notes;
          _showNotes = false;
        });
      } else if (previous?.notes != next.notes && _notesController.text != next.notes) {
        _notesController.text = next.notes;
      }
    });

    final state = ref.watch(gameNotifierProvider);
    final settings = ref.watch(settingsNotifierProvider);
    final notifier = ref.read(gameNotifierProvider.notifier);
    final theme = Theme.of(context);

    if (state.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final floors = state.options['Floor']!;
    final categories = state.categories.where((c) => c != 'Floor').toList();

    String titleText = 'Matrix Puzzle';
    if (state.gameType == 'level') {
      titleText = 'Level ${state.levelNumber}';
    } else if (state.gameType == 'daily') {
      titleText = 'Daily Challenge';
    } else if (state.gameType == 'practice') {
      titleText = 'Practice Building';
    }

    final displayedClues = settings.moveCrossedCluesToBottom
        ? [
            ...state.clues.where((clue) => !state.crossedClues.contains(clue)),
            ...state.clues.where((clue) => state.crossedClues.contains(clue)),
          ]
        : state.clues;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          titleText,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: theme.colorScheme.onSurface,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              showDialog(
                context: context,
                builder: (dialogContext) => AlertDialog(
                  backgroundColor: const Color(0xFF12131C),
                  title: const Text(
                    'Reset Game',
                    style: TextStyle(color: Color(0xFFE4EBE7)),
                  ),
                  content: const Text(
                    'Are you sure you want to reset the current game?',
                    style: TextStyle(color: Color(0xFFE4EBE7)),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(dialogContext),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Color(0xFFE4EBE7)),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(dialogContext);
                        if (state.gameType == 'level' && state.levelNumber != null) {
                          notifier.startNewLevel(state.levelNumber!);
                        } else if (state.gameType == 'daily' && state.dailyDate != null) {
                          notifier.startDailyChallenge(state.dailyDate!);
                        } else {
                          notifier.startPracticeGame(
                            floorsCount: state.options['Floor']!.length,
                          );
                        }
                      },
                      child: const Text(
                        'Reset',
                        style: TextStyle(color: Color(0xFFDCA134)),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: state.isVictory
          ? _buildVictoryOverlay(context, state, notifier, theme)
          : (settings.autoCheckSolution
              ? null
              : _buildCheckButton(context, state, notifier, theme)),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'undo_fab',
            backgroundColor: const Color(0xFF1E2030),
            foregroundColor: const Color(0xFF4FFBDF),
            onPressed: notifier.canUndo ? () => notifier.undo() : null,
            child: const Icon(Icons.undo),
          ),
          const SizedBox(height: 12),
          FloatingActionButton(
            heroTag: 'notes_fab',
            backgroundColor: const Color(0xFF1E2030),
            foregroundColor: const Color(0xFF4FFBDF),
            onPressed: () {
              setState(() {
                _showNotes = !_showNotes;
              });
            },
            child: Icon(_showNotes ? Icons.format_list_bulleted : Icons.edit_note),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1E2030),
                border: Border.all(color: const Color(0xFF4A4F6B)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Table(
                border: TableBorder.all(
                  color: const Color(0xFF4A4F6B),
                  width: 0.5,
                ),
                children: [
                  TableRow(
                    children: [
                      _Cell(text: 'Floor', isHeader: true),
                      ...categories.map((cat) => _Cell(text: cat, isHeader: true)),
                    ],
                  ),
                  ...floors.reversed.map((floor) {
                    return TableRow(
                      children: [
                        _Cell(text: _floorLabel(floor, floors.length), isHeader: true),
                        ...categories.map((cat) {
                          final value = state.userSolution[floor]![cat] ?? '-';
                          final isSelected = value != '-';
                          return GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              _showPicker(context, cat, ['-', ...state.options[cat]!], (val) {
                                notifier.updateAssignment(floor, cat, val);
                              });
                            },
                            child: _Cell(text: value, isSelected: isSelected),
                          );
                        }),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _showNotes
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "NOTES",
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                            color: const Color(0xFF4FFBDF),
                          ),
                        ),
                        const Divider(color: Color(0xFF4A4F6B)),
                        TextField(
                          controller: _notesController,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          onChanged: (text) {
                            notifier.updateNotes(text);
                          },
                          style: const TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 14,
                            height: 1.4,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Write your notes or deductions here...',
                            hintStyle: TextStyle(
                              color: const Color(0xFFFFFFFF).withValues(alpha: 0.4),
                              fontSize: 14,
                            ),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                          ),
                        ),
                        const SizedBox(height: 80),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "CLUES",
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                            color: const Color(0xFF4FFBDF),
                          ),
                        ),
                        const Divider(color: Color(0xFF4A4F6B)),
                        ...displayedClues.map((clue) {
                          final isCrossed = state.crossedClues.contains(clue);
                          return InkWell(
                            onTap: () {
                              notifier.toggleClueCrossed(clue);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "• ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: isCrossed ? const Color(0xFF4A4F6B) : const Color(0xFFFFFFFF),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      clue,
                                      style: theme.textTheme.bodyMedium?.copyWith(
                                        decoration: isCrossed ? TextDecoration.lineThrough : null,
                                        color: isCrossed ? const Color(0xFF4A4F6B) : const Color(0xFFFFFFFF),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                        const SizedBox(height: 80),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }

  String _floorLabel(String floorStr, int floorsCount) {
    final floor = int.parse(floorStr);
    if (floor == 1) return 'G';
    if (floor == floorsCount) return 'T';
    return '$floor';
  }

  Widget _buildVictoryOverlay(BuildContext context, GameStateModel state, GameNotifier notifier, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: const BoxDecoration(
        color: Color(0xFF1E2030),
        border: Border(
          top: BorderSide(color: Color(0xFF4A4F6B), width: 1),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Congratulations! You solved the puzzle correctly!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (state.gameType == 'level' && state.levelNumber != null)
                  FilledButton(
                    onPressed: () {
                      notifier.startNewLevel(state.levelNumber! + 1);
                    },
                    child: const Text('Next Level'),
                  )
                else
                  FilledButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Main Menu'),
                  ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: () async {
                    final url = Uri.parse('https://ko-fi.com/sidhant947');
                    try {
                      await launchUrl(url, mode: LaunchMode.externalApplication);
                    } catch (_) {
                      await launchUrl(url, mode: LaunchMode.platformDefault);
                    }
                  },
                  icon: const Icon(Icons.coffee, size: 18, color: Color(0xFF4FFBDF)),
                  label: const Text(
                    'Buy me a coffee',
                    style: TextStyle(color: Color(0xFFFFFFFF)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckButton(BuildContext context, GameStateModel state, GameNotifier notifier, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: const BoxDecoration(
        color: Color(0xFF1E2030),
        border: Border(
          top: BorderSide(color: Color(0xFF4A4F6B), width: 1),
        ),
      ),
      child: SafeArea(
        child: FilledButton(
          onPressed: () {
            final isCorrect = notifier.checkSolution();
            if (!isCorrect) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: const Color(0xFF1E2030),
                  title: const Text(
                    'Incorrect Solution',
                    style: TextStyle(color: Color(0xFFFFFFFF)),
                  ),
                  content: const Text(
                    'The solution is incorrect. Keep trying!',
                    style: TextStyle(color: Color(0xFFFFFFFF)),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'OK',
                        style: TextStyle(color: Color(0xFF4FFBDF)),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
          child: const Text('Check Solution'),
        ),
      ),
    );
  }

  void _showPicker(BuildContext context, String title, List<String> options, Function(String) onSelect) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
              const Divider(height: 1, color: Color(0xFF4A4F6B)),
              Expanded(
                child: ListView.builder(
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        options[index],
                        style: const TextStyle(color: Color(0xFFFFFFFF)),
                      ),
                      onTap: () {
                        onSelect(options[index]);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Cell extends StatelessWidget {
  final String text;
  final bool isHeader;
  final bool isSelected;

  const _Cell({
    required this.text,
    this.isHeader = false,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      height: 48,
      alignment: Alignment.center,
      color: isHeader ? const Color(0xFF1E2030) : null,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: TextStyle(
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            color: isSelected
                ? const Color(0xFF4FFBDF)
                : (isHeader ? const Color(0xFFFFFFFF) : const Color(0xFFFFFFFF).withValues(alpha: 0.7)),
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}
