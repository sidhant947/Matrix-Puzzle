import 'dart:math';
import 'package:hive/hive.dart';

part 'matrix_puzzle_engine.g.dart';

@HiveType(typeId: 0)
class MatrixPuzzleEngine {
  final Random _random = Random();

  static const List<String> _names = [
    'James', 'Maria', 'Chen', 'Yuki', 'Ahmed',
    'Sofia', 'Dmitri', 'Priya', 'Omar', 'Elena',
  ];
  static const List<String> _nationalities = [
    'American', 'Brazilian', 'Chinese', 'Japanese', 'Egyptian',
    'Spanish', 'Russian', 'Indian', 'Moroccan', 'Italian',
  ];
  static const List<String> _professions = [
    'Doctor', 'Engineer', 'Teacher', 'Artist', 'Lawyer',
    'Pilot', 'Chef', 'Nurse', 'Architect', 'Musician',
  ];

  static const int maxFloors = 10;

  Map<String, dynamic> generatePuzzle({int floorsCount = 5, int? seed}) {
    final count = floorsCount.clamp(3, 10);
    final rand = seed != null ? Random(seed) : _random;

    final solution = _generateRandomSolution(count, rand);
    final clues = _generateClues(solution, count, rand);

    final floors = List.generate(count, (i) => (i + 1).toString());
    final options = {
      'Floor': floors,
      'Name': List<String>.from(_names.sublist(0, count))..shuffle(rand),
      'Nationality': List<String>.from(_nationalities.sublist(0, count))..shuffle(rand),
      'Profession': List<String>.from(_professions.sublist(0, count))..shuffle(rand),
    };

    final mappedSolution = <String, Map<String, String>>{};
    for (var i = 0; i < count; i++) {
      mappedSolution[(i + 1).toString()] = {
        'Name': solution[i]['Name']!,
        'Nationality': solution[i]['Nationality']!,
        'Profession': solution[i]['Profession']!,
      };
    }

    return {
      'categories': ['Floor', 'Name', 'Nationality', 'Profession'],
      'options': options,
      'clues': clues,
      'solution': mappedSolution,
    };
  }

  List<Map<String, String>> _generateRandomSolution(int floorsCount, Random rand) {
    final names = List<String>.from(_names.sublist(0, floorsCount))..shuffle(rand);
    final nationalities = List<String>.from(_nationalities.sublist(0, floorsCount))..shuffle(rand);
    final professions = List<String>.from(_professions.sublist(0, floorsCount))..shuffle(rand);

    return List.generate(floorsCount, (i) => {
      'Name': names[i],
      'Nationality': nationalities[i],
      'Profession': professions[i],
    });
  }

  List<String> _generateClues(List<Map<String, String>> solution, int floorsCount, Random rand) {
    final categories = ['Name', 'Nationality', 'Profession'];

    final candidates = <_ClueConstraint>[];
    for (var f = 0; f < floorsCount; f++) {
      for (final cat in categories) {
        candidates.add(_ClueConstraint(
          type: _ClueKind.fixedFloor,
          cat1: cat,
          val1: solution[f][cat]!,
          floor: f,
        ));
      }
    }

    for (var f = 0; f < floorsCount - 1; f++) {
      for (final catA in categories) {
        for (final catB in categories) {
          candidates.add(_ClueConstraint(
            type: _ClueKind.immediateAbove,
            cat1: catA,
            val1: solution[f + 1][catA]!,
            cat2: catB,
            val2: solution[f][catB]!,
          ));
        }
      }
    }

    if (floorsCount >= 4) {
      for (var f1 = 0; f1 < floorsCount; f1++) {
        for (var f2 = 0; f2 < f1; f2++) {
          if (f1 - f2 >= 2) {
            for (final catA in categories) {
              for (final catB in categories) {
                candidates.add(_ClueConstraint(
                  type: _ClueKind.somewhereAbove,
                  cat1: catA,
                  val1: solution[f1][catA]!,
                  cat2: catB,
                  val2: solution[f2][catB]!,
                ));
              }
            }
          }
        }
      }
    }

    for (var f = 0; f < floorsCount; f++) {
      for (var c1 = 0; c1 < categories.length; c1++) {
        for (var c2 = c1 + 1; c2 < categories.length; c2++) {
          candidates.add(_ClueConstraint(
            type: _ClueKind.sameFloor,
            cat1: categories[c1],
            val1: solution[f][categories[c1]]!,
            cat2: categories[c2],
            val2: solution[f][categories[c2]]!,
          ));
        }
      }
    }

    candidates.shuffle(rand);

    final selectedClues = <_ClueConstraint>[];

    final maxAnchors = floorsCount <= 4 ? 1 : (floorsCount <= 7 ? 2 : 3);
    final anchorPool = candidates.where((c) => c.type == _ClueKind.fixedFloor).toList()..shuffle(rand);
    for (final a in anchorPool) {
      if (selectedClues.where((c) => c.type == _ClueKind.fixedFloor).length < maxAnchors) {
        selectedClues.add(a);
      }
    }

    final mentionedNames = <String>{};
    final mentionedNats = <String>{};
    final mentionedProfs = <String>{};

    void updateMentioned(_ClueConstraint c) {
      if (c.cat1 == 'Name') mentionedNames.add(c.val1);
      if (c.cat1 == 'Nationality') mentionedNats.add(c.val1);
      if (c.cat1 == 'Profession') mentionedProfs.add(c.val1);
      if (c.cat2 != null && c.val2 != null) {
        if (c.cat2 == 'Name') mentionedNames.add(c.val2!);
        if (c.cat2 == 'Nationality') mentionedNats.add(c.val2!);
        if (c.cat2 == 'Profession') mentionedProfs.add(c.val2!);
      }
    }

    for (final c in selectedClues) {
      updateMentioned(c);
    }

    final nonAnchorPool = candidates.where((c) => c.type != _ClueKind.fixedFloor).toList()..shuffle(rand);
    for (final c in nonAnchorPool) {
      selectedClues.add(c);
      updateMentioned(c);
      if (_isFullySolvable(selectedClues, floorsCount, solution, categories)) {
        break;
      }
    }

    for (var f = 0; f < floorsCount; f++) {
      final name = solution[f]['Name']!;
      final nat = solution[f]['Nationality']!;
      final prof = solution[f]['Profession']!;

      if (!mentionedNames.contains(name) || !mentionedNats.contains(nat)) {
        final link = _ClueConstraint(
          type: _ClueKind.sameFloor,
          cat1: 'Name',
          val1: name,
          cat2: 'Nationality',
          val2: nat,
        );
        selectedClues.add(link);
        updateMentioned(link);
      }

      if (!mentionedProfs.contains(prof)) {
        final link = _ClueConstraint(
          type: _ClueKind.sameFloor,
          cat1: 'Name',
          val1: name,
          cat2: 'Profession',
          val2: prof,
        );
        selectedClues.add(link);
        updateMentioned(link);
      }
    }

    for (var f = 0; f < floorsCount - 1; f++) {
      final step = _ClueConstraint(
        type: _ClueKind.immediateAbove,
        cat1: 'Name',
        val1: solution[f + 1]['Name']!,
        cat2: 'Name',
        val2: solution[f]['Name']!,
      );
      if (!_isFullySolvable(selectedClues, floorsCount, solution, categories)) {
        selectedClues.add(step);
      }
    }

    final formattedClues = selectedClues.map((c) => c.toText(floorsCount, rand)).toSet().toList();
    formattedClues.shuffle(rand);
    return formattedClues;
  }

  static bool _isFullySolvable(
    List<_ClueConstraint> constraints,
    int floorsCount,
    List<Map<String, String>> solution,
    List<String> categories,
  ) {
    if (floorsCount > 6) return true;

    final names = List.generate(floorsCount, (i) => solution[i]['Name']!);
    final nats = List.generate(floorsCount, (i) => solution[i]['Nationality']!);
    final profs = List.generate(floorsCount, (i) => solution[i]['Profession']!);

    int validSolutions = 0;

    void search(int floor, List<int> nAssign, List<int> natAssign, List<int> pAssign, int usedN, int usedNat, int usedP) {
      if (validSolutions >= 2) return;
      if (floor == floorsCount) {
        final grid = List.generate(floorsCount, (i) => {
          'Name': names[nAssign[i]],
          'Nationality': nats[natAssign[i]],
          'Profession': profs[pAssign[i]],
        });
        bool pass = true;
        for (final c in constraints) {
          if (!c.isSatisfied(grid, floorsCount)) {
            pass = false;
            break;
          }
        }
        if (pass) validSolutions++;
        return;
      }

      for (var n = 0; n < floorsCount; n++) {
        if ((usedN & (1 << n)) != 0) continue;
        for (var nat = 0; nat < floorsCount; nat++) {
          if ((usedNat & (1 << nat)) != 0) continue;
          for (var p = 0; p < floorsCount; p++) {
            if ((usedP & (1 << p)) != 0) continue;

            bool ok = true;
            for (final c in constraints) {
              if (c.type == _ClueKind.fixedFloor && c.floor == floor) {
                if (c.cat1 == 'Name' && names[n] != c.val1) { ok = false; break; }
                if (c.cat1 == 'Nationality' && nats[nat] != c.val1) { ok = false; break; }
                if (c.cat1 == 'Profession' && profs[p] != c.val1) { ok = false; break; }
              }
              if (c.type == _ClueKind.sameFloor) {
                final v1 = c.cat1 == 'Name' ? names[n] : (c.cat1 == 'Nationality' ? nats[nat] : profs[p]);
                final v2 = c.cat2 == 'Name' ? names[n] : (c.cat2 == 'Nationality' ? nats[nat] : profs[p]);
                if (v1 == c.val1 && v2 != c.val2) { ok = false; break; }
                if (v2 == c.val2 && v1 != c.val1) { ok = false; break; }
              }
            }

            if (ok) {
              nAssign[floor] = n;
              natAssign[floor] = nat;
              pAssign[floor] = p;
              search(floor + 1, nAssign, natAssign, pAssign, usedN | (1 << n), usedNat | (1 << nat), usedP | (1 << p));
            }
            if (validSolutions >= 2) break;
          }
          if (validSolutions >= 2) break;
        }
        if (validSolutions >= 2) break;
      }
    }

    search(
      0,
      List.filled(floorsCount, 0),
      List.filled(floorsCount, 0),
      List.filled(floorsCount, 0),
      0,
      0,
      0,
    );

    return validSolutions == 1;
  }

  bool checkVictory(Map<String, Map<String, String>> userSolution, Map<String, Map<String, String>> actualSolution) {
    for (var floor in actualSolution.keys) {
      if (!userSolution.containsKey(floor)) return false;
      var userFloor = userSolution[floor]!;
      var actualFloor = actualSolution[floor]!;
      for (var category in actualFloor.keys) {
        if (userFloor[category] != actualFloor[category]) return false;
      }
    }
    return true;
  }
}

enum _ClueKind { fixedFloor, sameFloor, immediateAbove, somewhereAbove }

class _ClueConstraint {
  final _ClueKind type;
  final String cat1;
  final String val1;
  final String? cat2;
  final String? val2;
  final int? floor;

  _ClueConstraint({
    required this.type,
    required this.cat1,
    required this.val1,
    this.cat2,
    this.val2,
    this.floor,
  });

  bool isSatisfied(List<Map<String, String>> grid, int floorsCount) {
    int findFloor(String cat, String val) {
      for (var i = 0; i < grid.length; i++) {
        if (grid[i][cat] == val) return i;
      }
      return -1;
    }

    final f1 = findFloor(cat1, val1);
    if (f1 == -1) return false;

    switch (type) {
      case _ClueKind.fixedFloor:
        return f1 == floor;
      case _ClueKind.sameFloor:
        final f2 = findFloor(cat2!, val2!);
        return f1 == f2;
      case _ClueKind.immediateAbove:
        final f2 = findFloor(cat2!, val2!);
        return f1 == f2 + 1;
      case _ClueKind.somewhereAbove:
        final f2 = findFloor(cat2!, val2!);
        return f1 > f2;
    }
  }

  String toText(int floorsCount, Random rand) {
    final subj1 = _subject(cat1, val1, capitalize: true);

    switch (type) {
      case _ClueKind.fixedFloor:
        final floorNum = floor! + 1;
        if (floorNum == 1) {
          return "$subj1 lives on the 1st floor.";
        } else if (floorNum == floorsCount) {
          return "$subj1 lives on the ${_ordinal(floorNum)} floor (top floor).";
        } else {
          return "$subj1 lives on the ${_ordinal(floorNum)} floor.";
        }

      case _ClueKind.sameFloor:
        final obj2 = _subject(cat2!, val2!, capitalize: false);
        if (cat1 == 'Name' && cat2 == 'Nationality') {
          return "$val1 is $val2.";
        } else if (cat1 == 'Name' && cat2 == 'Profession') {
          return "$val1 is ${_article(val2!)} $val2.";
        } else if (cat1 == 'Nationality' && cat2 == 'Profession') {
          return "The $val1 person is ${_article(val2!)} $val2.";
        }
        return "$subj1 is $obj2.";

      case _ClueKind.immediateAbove:
        final obj2 = _subject(cat2!, val2!, capitalize: false);
        return "$subj1 lives directly above $obj2.";

      case _ClueKind.somewhereAbove:
        final obj2 = _subject(cat2!, val2!, capitalize: false);
        return "$subj1 lives somewhere above $obj2.";
    }
  }

  static String _subject(String cat, String val, {required bool capitalize}) {
    if (cat == 'Name') {
      return val;
    }
    if (cat == 'Nationality') {
      return capitalize ? "The $val person" : "the $val person";
    }
    return capitalize ? "The $val" : "the $val";
  }

  static String _ordinal(int n) {
    if (n >= 11 && n <= 13) return '${n}th';
    switch (n % 10) {
      case 1: return '${n}st';
      case 2: return '${n}nd';
      case 3: return '${n}rd';
      default: return '${n}th';
    }
  }

  static String _article(String noun) {
    if (noun.isEmpty) return 'a';
    final firstLetter = noun[0].toLowerCase();
    return 'aeiou'.contains(firstLetter) ? 'an' : 'a';
  }
}

@HiveType(typeId: 1)
enum ClueType {
  @HiveField(0)
  sameFloor,
  @HiveField(1)
  floorBelow,
  @HiveField(2)
  floorAbove,
  @HiveField(3)
  fixedFloor,
  @HiveField(4)
  adjacentFloor,
}

@HiveType(typeId: 2)
class Clue {
  @HiveField(0)
  final String text;
  @HiveField(1)
  final ClueType type;
  @HiveField(2)
  final List<String> data;

  Clue(this.text, this.data, this.type);
}

class MatrixSolver {
  final int floorsCount;

  MatrixSolver(this.floorsCount);

  bool hasUniqueSolution(List<Clue> clues) {
    return true;
  }
}
