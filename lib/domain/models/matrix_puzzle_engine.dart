import 'dart:convert';
import 'dart:math';
import 'package:hive/hive.dart';
import '../../l10n/app_localizations.dart';

part 'matrix_puzzle_engine.g.dart';

@HiveType(typeId: 0)
class MatrixPuzzleEngine {
  final Random _random = Random();

  static const Map<String, List<String>> _categoryPool = {
    'Name': [
      'James', 'Maria', 'Priya', 'Chen', 'Elena', 'Sofia', 'Ahmed', 'Dmitri', 'Yuki', 'Omar',
      'Fatima', 'Aisha', 'Mei', 'Chloe', 'Zara', 'Lucia', 'Amara', 'Ingrid', 'Ananya', 'Leila',
    ],
    'Profession': ['Doctor', 'Engineer', 'Teacher', 'Artist', 'Lawyer', 'Pilot', 'Chef', 'Nurse', 'Architect', 'Musician'],
    'Pet': ['Cat', 'Dog', 'Parrot', 'Hamster', 'Turtle', 'Rabbit', 'Iguana', 'Ferret', 'Fish', 'Hedgehog'],
    'Hobby': ['Gardening', 'Photography', 'Chess', 'Painting', 'Baking', 'Astronomy', 'Gaming', 'Hiking', 'Yoga', 'Origami'],
    'Drink': ['Espresso', 'Green Tea', 'Cocoa', 'Lemonade', 'Boba', 'Cappuccino', 'Smoothie', 'Chai', 'Milkshake', 'Iced Coffee'],
    'Color': ['Crimson', 'Sapphire', 'Emerald', 'Amber', 'Violet', 'Coral', 'Teal', 'Gold', 'Lavender', 'Turquoise'],
    'Vehicle': ['Bicycle', 'Scooter', 'Electric Car', 'Vintage Car', 'Motorcycle', 'Skateboard', 'Unicycle', 'Segway', 'Rollerblades', 'Moped'],
    'Instrument': ['Piano', 'Guitar', 'Violin', 'Drums', 'Flute', 'Saxophone', 'Cello', 'Trumpet', 'Harp', 'Clarinet'],
    'Nationality': ['American', 'Brazilian', 'Chinese', 'Japanese', 'Egyptian', 'Spanish', 'Russian', 'Indian', 'Moroccan', 'Italian'],
  };

  static const List<List<String>> _themes = [
    ['Name', 'Profession', 'Nationality'],
    ['Name', 'Pet', 'Hobby'],
    ['Name', 'Drink', 'Color'],
    ['Name', 'Vehicle', 'Profession'],
    ['Name', 'Instrument', 'Drink'],
    ['Name', 'Pet', 'Color'],
    ['Name', 'Hobby', 'Instrument'],
    ['Name', 'Nationality', 'Vehicle'],
    ['Name', 'Profession', 'Pet'],
    ['Name', 'Drink', 'Hobby'],
  ];

  static const int maxFloors = 10;

  Map<String, dynamic> generatePuzzle({int floorsCount = 5, int? seed, int? levelNumber}) {
    final count = floorsCount.clamp(3, 10);
    final rand = seed != null ? Random(seed) : _random;

    final theme = levelNumber != null
        ? _themes[(levelNumber - 1) % _themes.length]
        : _themes[rand.nextInt(_themes.length)];

    final activeCategories = theme;

    final options = <String, List<String>>{
      'Floor': List.generate(count, (i) => (i + 1).toString()),
    };

    final subItems = <String, List<String>>{};
    for (final cat in activeCategories) {
      final items = (List<String>.from(_categoryPool[cat]!)..shuffle(rand)).sublist(0, count);
      subItems[cat] = items;
      options[cat] = List<String>.from(items)..shuffle(rand);
    }

    final solution = List.generate(count, (i) => <String, String>{});
    for (final cat in activeCategories) {
      final shuffled = List<String>.from(subItems[cat]!)..shuffle(rand);
      for (var f = 0; f < count; f++) {
        solution[f][cat] = shuffled[f];
      }
    }

    final clues = _generateClues(
      solution: solution,
      floorsCount: count,
      categories: activeCategories,
      itemsByCategory: subItems,
      rand: rand,
      levelNumber: levelNumber,
    );

    final mappedSolution = <String, Map<String, String>>{};
    for (var i = 0; i < count; i++) {
      mappedSolution[(i + 1).toString()] = solution[i];
    }

    return {
      'categories': ['Floor', ...activeCategories],
      'options': options,
      'clues': clues,
      'solution': mappedSolution,
    };
  }

  List<String> _generateClues({
    required List<Map<String, String>> solution,
    required int floorsCount,
    required List<String> categories,
    required Map<String, List<String>> itemsByCategory,
    required Random rand,
    int? levelNumber,
  }) {
    final solver = _FastMatrixSolver(floorsCount, categories, itemsByCategory);

    final candidates = <_ClueConstraint>[];

    final effectiveLevel = levelNumber ?? (floorsCount <= 4 ? 10 : (floorsCount <= 6 ? 30 : (floorsCount <= 8 ? 60 : 85)));

    final allowAnchors = (effectiveLevel <= 40) || (effectiveLevel <= 70 && rand.nextBool());
    final maxAnchors = (effectiveLevel <= 15) ? 2 : ((effectiveLevel <= 40) ? 1 : (allowAnchors ? 1 : 0));
    final allowParity = effectiveLevel >= 16;
    final allowNegative = effectiveLevel >= 16;
    final allowDistance = effectiveLevel >= 41;
    final allowBetween = effectiveLevel >= 41;

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

    if (allowParity) {
      for (var f = 0; f < floorsCount; f++) {
        final isOdd = (f + 1) % 2 == 1;
        for (final cat in categories) {
          candidates.add(_ClueConstraint(
            type: _ClueKind.parityFloor,
            cat1: cat,
            val1: solution[f][cat]!,
            isOdd: isOdd,
          ));
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

    if (allowNegative) {
      for (var f1 = 0; f1 < floorsCount; f1++) {
        for (var f2 = 0; f2 < floorsCount; f2++) {
          if (f1 != f2) {
            candidates.add(_ClueConstraint(
              type: _ClueKind.negativeSameFloor,
              cat1: 'Name',
              val1: solution[f1]['Name']!,
              cat2: categories[1],
              val2: solution[f2][categories[1]]!,
            ));
            candidates.add(_ClueConstraint(
              type: _ClueKind.negativeSameFloor,
              cat1: 'Name',
              val1: solution[f1]['Name']!,
              cat2: categories[2],
              val2: solution[f2][categories[2]]!,
            ));
          }
        }
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

    for (var f = 0; f < floorsCount - 1; f++) {
      for (final catA in categories) {
        for (final catB in categories) {
          candidates.add(_ClueConstraint(
            type: _ClueKind.adjacentFloor,
            cat1: catA,
            val1: solution[f + 1][catA]!,
            cat2: catB,
            val2: solution[f][catB]!,
          ));
        }
      }
    }

    if (allowDistance && floorsCount >= 4) {
      for (var f = 0; f < floorsCount - 2; f++) {
        candidates.add(_ClueConstraint(
          type: _ClueKind.distanceAbove,
          cat1: 'Name',
          val1: solution[f + 2]['Name']!,
          cat2: categories[1],
          val2: solution[f][categories[1]]!,
          distance: 2,
        ));
      }
    }

    if (allowBetween && floorsCount >= 4) {
      for (var f1 = 1; f1 < floorsCount - 1; f1++) {
        for (var f2 = 0; f2 < f1; f2++) {
          for (var f3 = f1 + 1; f3 < floorsCount; f3++) {
            candidates.add(_ClueConstraint(
              type: _ClueKind.betweenFloors,
              cat1: 'Name',
              val1: solution[f1]['Name']!,
              cat2: categories[1],
              val2: solution[f2][categories[1]]!,
              cat3: categories[2],
              val3: solution[f3][categories[2]]!,
            ));
          }
        }
      }
    }

    candidates.shuffle(rand);

    final selectedClues = <_ClueConstraint>[];

    if (maxAnchors > 0) {
      final anchors = candidates.where((c) => c.type == _ClueKind.fixedFloor).toList()..shuffle(rand);
      for (final a in anchors) {
        if (selectedClues.where((c) => c.type == _ClueKind.fixedFloor).length < maxAnchors) {
          selectedClues.add(a);
        }
      }
    }

    final nonAnchors = candidates.where((c) => c.type != _ClueKind.fixedFloor).toList()..shuffle(rand);
    for (final c in nonAnchors) {
      selectedClues.add(c);
      if (solver.countSolutions(selectedClues) == 1) {
        break;
      }
    }

    if (solver.countSolutions(selectedClues) != 1) {
      for (var f = 0; f < floorsCount; f++) {
        selectedClues.add(_ClueConstraint(
          type: _ClueKind.sameFloor,
          cat1: categories[0],
          val1: solution[f][categories[0]]!,
          cat2: categories[1],
          val2: solution[f][categories[1]]!,
        ));
        selectedClues.add(_ClueConstraint(
          type: _ClueKind.sameFloor,
          cat1: categories[0],
          val1: solution[f][categories[0]]!,
          cat2: categories[2],
          val2: solution[f][categories[2]]!,
        ));
        if (solver.countSolutions(selectedClues) == 1) break;
      }
    }

    if (solver.countSolutions(selectedClues) != 1) {
      for (var f = 0; f < floorsCount - 1; f++) {
        selectedClues.add(_ClueConstraint(
          type: _ClueKind.immediateAbove,
          cat1: 'Name',
          val1: solution[f + 1]['Name']!,
          cat2: 'Name',
          val2: solution[f]['Name']!,
        ));
        if (solver.countSolutions(selectedClues) == 1) break;
      }
    }

    for (var i = selectedClues.length - 1; i >= 0; i--) {
      final testSet = List<_ClueConstraint>.from(selectedClues)..removeAt(i);
      if (solver.countSolutions(testSet) == 1) {
        selectedClues.removeAt(i);
      }
    }

    final formattedClues = selectedClues.map((c) => c.toJsonString(floorsCount)).toSet().toList();
    formattedClues.shuffle(rand);
    return formattedClues;
  }

  static String formatClue(String clue, AppLocalizations l10n) {
    final constraint = _ClueConstraint.fromJsonString(clue);
    if (constraint != null) {
      return constraint.toLocalizedText(l10n);
    }
    return clue;
  }

  static String localizeItem(AppLocalizations l10n, String item) {
    switch (item) {
      case 'James': return l10n.itemJames;
      case 'Maria': return l10n.itemMaria;
      case 'Priya': return l10n.itemPriya;
      case 'Chen': return l10n.itemChen;
      case 'Elena': return l10n.itemElena;
      case 'Sofia': return l10n.itemSofia;
      case 'Ahmed': return l10n.itemAhmed;
      case 'Dmitri': return l10n.itemDmitri;
      case 'Yuki': return l10n.itemYuki;
      case 'Omar': return l10n.itemOmar;
      case 'Fatima': return l10n.itemFatima;
      case 'Aisha': return l10n.itemAisha;
      case 'Mei': return l10n.itemMei;
      case 'Chloe': return l10n.itemChloe;
      case 'Zara': return l10n.itemZara;
      case 'Lucia': return l10n.itemLucia;
      case 'Amara': return l10n.itemAmara;
      case 'Ingrid': return l10n.itemIngrid;
      case 'Ananya': return l10n.itemAnanya;
      case 'Leila': return l10n.itemLeila;
      case 'Doctor': return l10n.itemDoctor;
      case 'Engineer': return l10n.itemEngineer;
      case 'Teacher': return l10n.itemTeacher;
      case 'Artist': return l10n.itemArtist;
      case 'Lawyer': return l10n.itemLawyer;
      case 'Pilot': return l10n.itemPilot;
      case 'Chef': return l10n.itemChef;
      case 'Nurse': return l10n.itemNurse;
      case 'Architect': return l10n.itemArchitect;
      case 'Musician': return l10n.itemMusician;
      case 'Cat': return l10n.itemCat;
      case 'Dog': return l10n.itemDog;
      case 'Parrot': return l10n.itemParrot;
      case 'Hamster': return l10n.itemHamster;
      case 'Turtle': return l10n.itemTurtle;
      case 'Rabbit': return l10n.itemRabbit;
      case 'Iguana': return l10n.itemIguana;
      case 'Ferret': return l10n.itemFerret;
      case 'Fish': return l10n.itemFish;
      case 'Hedgehog': return l10n.itemHedgehog;
      case 'Gardening': return l10n.itemGardening;
      case 'Photography': return l10n.itemPhotography;
      case 'Chess': return l10n.itemChess;
      case 'Painting': return l10n.itemPainting;
      case 'Baking': return l10n.itemBaking;
      case 'Astronomy': return l10n.itemAstronomy;
      case 'Gaming': return l10n.itemGaming;
      case 'Hiking': return l10n.itemHiking;
      case 'Yoga': return l10n.itemYoga;
      case 'Origami': return l10n.itemOrigami;
      case 'Espresso': return l10n.itemEspresso;
      case 'Green Tea': return l10n.itemGreenTea;
      case 'Cocoa': return l10n.itemCocoa;
      case 'Lemonade': return l10n.itemLemonade;
      case 'Boba': return l10n.itemBoba;
      case 'Cappuccino': return l10n.itemCappuccino;
      case 'Smoothie': return l10n.itemSmoothie;
      case 'Chai': return l10n.itemChai;
      case 'Milkshake': return l10n.itemMilkshake;
      case 'Iced Coffee': return l10n.itemIcedCoffee;
      case 'Crimson': return l10n.itemCrimson;
      case 'Sapphire': return l10n.itemSapphire;
      case 'Emerald': return l10n.itemEmerald;
      case 'Amber': return l10n.itemAmber;
      case 'Violet': return l10n.itemViolet;
      case 'Coral': return l10n.itemCoral;
      case 'Teal': return l10n.itemTeal;
      case 'Gold': return l10n.itemGold;
      case 'Lavender': return l10n.itemLavender;
      case 'Turquoise': return l10n.itemTurquoise;
      case 'Bicycle': return l10n.itemBicycle;
      case 'Scooter': return l10n.itemScooter;
      case 'Electric Car': return l10n.itemElectricCar;
      case 'Vintage Car': return l10n.itemVintageCar;
      case 'Motorcycle': return l10n.itemMotorcycle;
      case 'Skateboard': return l10n.itemSkateboard;
      case 'Unicycle': return l10n.itemUnicycle;
      case 'Segway': return l10n.itemSegway;
      case 'Rollerblades': return l10n.itemRollerblades;
      case 'Moped': return l10n.itemMoped;
      case 'Piano': return l10n.itemPiano;
      case 'Guitar': return l10n.itemGuitar;
      case 'Violin': return l10n.itemViolin;
      case 'Drums': return l10n.itemDrums;
      case 'Flute': return l10n.itemFlute;
      case 'Saxophone': return l10n.itemSaxophone;
      case 'Cello': return l10n.itemCello;
      case 'Trumpet': return l10n.itemTrumpet;
      case 'Harp': return l10n.itemHarp;
      case 'Clarinet': return l10n.itemClarinet;
      case 'American': return l10n.itemAmerican;
      case 'Brazilian': return l10n.itemBrazilian;
      case 'Chinese': return l10n.itemChinese;
      case 'Japanese': return l10n.itemJapanese;
      case 'Egyptian': return l10n.itemEgyptian;
      case 'Spanish': return l10n.itemSpanish;
      case 'Russian': return l10n.itemRussian;
      case 'Indian': return l10n.itemIndian;
      case 'Moroccan': return l10n.itemMoroccan;
      case 'Italian': return l10n.itemItalian;
      default: return item;
    }
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

enum _ClueKind {
  fixedFloor,
  sameFloor,
  negativeSameFloor,
  immediateAbove,
  somewhereAbove,
  adjacentFloor,
  distanceAbove,
  betweenFloors,
  parityFloor,
}

class _ClueConstraint {
  final _ClueKind type;
  final String cat1;
  final String val1;
  final String? cat2;
  final String? val2;
  final String? cat3;
  final String? val3;
  final int? floor;
  final int? distance;
  final bool? isOdd;
  final int? floorsCount;

  _ClueConstraint({
    required this.type,
    required this.cat1,
    required this.val1,
    this.cat2,
    this.val2,
    this.cat3,
    this.val3,
    this.floor,
    this.distance,
    this.isOdd,
    this.floorsCount,
  });

  String toJsonString(int count) {
    final map = <String, dynamic>{
      'type': type.name,
      'cat1': cat1,
      'val1': val1,
      'floorsCount': count,
    };
    if (cat2 != null) map['cat2'] = cat2;
    if (val2 != null) map['val2'] = val2;
    if (cat3 != null) map['cat3'] = cat3;
    if (val3 != null) map['val3'] = val3;
    if (floor != null) map['floor'] = floor;
    if (distance != null) map['distance'] = distance;
    if (isOdd != null) map['isOdd'] = isOdd;
    return jsonEncode(map);
  }

  static _ClueConstraint? fromJsonString(String raw) {
    if (!raw.startsWith('{')) return null;
    try {
      final map = jsonDecode(raw);
      if (map is! Map<String, dynamic>) return null;
      final typeStr = map['type'] as String?;
      if (typeStr == null) return null;
      final kind = _ClueKind.values.firstWhere((e) => e.name == typeStr);
      return _ClueConstraint(
        type: kind,
        cat1: map['cat1'] as String,
        val1: map['val1'] as String,
        cat2: map['cat2'] as String?,
        val2: map['val2'] as String?,
        cat3: map['cat3'] as String?,
        val3: map['val3'] as String?,
        floor: map['floor'] as int?,
        distance: map['distance'] as int?,
        isOdd: map['isOdd'] as bool?,
        floorsCount: map['floorsCount'] as int?,
      );
    } catch (_) {
      return null;
    }
  }

  String toLocalizedText(AppLocalizations l10n) {
    final subj1 = _localizedSubject(cat1, val1, true, l10n);

    switch (type) {
      case _ClueKind.fixedFloor:
        final floorNum = floor! + 1;
        if (floorNum == 1) {
          return l10n.clueFixedFloorGround(subj1);
        } else if (floorsCount != null && floorNum == floorsCount) {
          return l10n.clueFixedFloorTop(subj1, _ordinal(floorNum));
        } else {
          return l10n.clueFixedFloor(subj1, _ordinal(floorNum));
        }

      case _ClueKind.parityFloor:
        return isOdd! ? l10n.clueParityOdd(subj1) : l10n.clueParityEven(subj1);

      case _ClueKind.sameFloor:
        return _formatLocalizedSameFloor(cat1, val1, cat2!, val2!, l10n);

      case _ClueKind.negativeSameFloor:
        return _formatLocalizedNegativeSameFloor(cat1, val1, cat2!, val2!, l10n);

      case _ClueKind.immediateAbove:
        final obj2 = _localizedSubject(cat2!, val2!, false, l10n);
        return l10n.clueImmediateAbove(subj1, obj2);

      case _ClueKind.somewhereAbove:
        final obj2 = _localizedSubject(cat2!, val2!, false, l10n);
        return l10n.clueSomewhereAbove(subj1, obj2);

      case _ClueKind.adjacentFloor:
        final obj2 = _localizedSubject(cat2!, val2!, false, l10n);
        return l10n.clueAdjacent(subj1, obj2);

      case _ClueKind.distanceAbove:
        final obj2 = _localizedSubject(cat2!, val2!, false, l10n);
        return l10n.clueDistanceAbove(subj1, obj2, distance!);

      case _ClueKind.betweenFloors:
        final obj2 = _localizedSubject(cat2!, val2!, false, l10n);
        final obj3 = _localizedSubject(cat3!, val3!, false, l10n);
        return l10n.clueBetween(subj1, obj2, obj3);
    }
  }

  static String _formatLocalizedSameFloor(String c1, String v1, String c2, String v2, AppLocalizations l10n) {
    if (c1 == 'Name') {
      final locV1 = MatrixPuzzleEngine.localizeItem(l10n, v1);
      final locV2 = MatrixPuzzleEngine.localizeItem(l10n, v2);
      final article = _article(locV2);
      if (c2 == 'Pet') return l10n.clueSameFloorPet(locV1, article, locV2);
      if (c2 == 'Hobby') return l10n.clueSameFloorHobby(locV1, locV2);
      if (c2 == 'Drink') return l10n.clueSameFloorDrink(locV1, locV2);
      if (c2 == 'Vehicle') return l10n.clueSameFloorVehicle(locV1, article, locV2);
      if (c2 == 'Instrument') return l10n.clueSameFloorInstrument(locV1, locV2);
      if (c2 == 'Color') return l10n.clueSameFloorColor(locV1, article, locV2);
      if (c2 == 'Profession') return l10n.clueSameFloorProfession(locV1, article, locV2);
      if (c2 == 'Nationality') return l10n.clueSameFloorNationality(locV1, locV2);
    }
    final subj = _localizedSubject(c1, v1, true, l10n);
    final obj = _localizedSubject(c2, v2, false, l10n);
    return l10n.clueSameFloorGeneric(subj, obj);
  }

  static String _formatLocalizedNegativeSameFloor(String c1, String v1, String c2, String v2, AppLocalizations l10n) {
    if (c1 == 'Name') {
      final locV1 = MatrixPuzzleEngine.localizeItem(l10n, v1);
      final locV2 = MatrixPuzzleEngine.localizeItem(l10n, v2);
      final article = _article(locV2);
      if (c2 == 'Pet') return l10n.clueNegativeFloorPet(locV1, article, locV2);
      if (c2 == 'Hobby') return l10n.clueNegativeFloorHobby(locV1, locV2);
      if (c2 == 'Drink') return l10n.clueNegativeFloorDrink(locV1, locV2);
      if (c2 == 'Vehicle') return l10n.clueNegativeFloorVehicle(locV1, article, locV2);
      if (c2 == 'Instrument') return l10n.clueNegativeFloorInstrument(locV1, locV2);
      if (c2 == 'Color') return l10n.clueNegativeFloorColor(locV1, article, locV2);
      if (c2 == 'Profession') return l10n.clueNegativeFloorProfession(locV1, article, locV2);
      if (c2 == 'Nationality') return l10n.clueNegativeFloorNationality(locV1, locV2);
    }
    final subj = _localizedSubject(c1, v1, true, l10n);
    final obj = _localizedSubject(c2, v2, false, l10n);
    return l10n.clueNegativeFloorGeneric(subj, obj);
  }

  static String _localizedSubject(String cat, String val, bool capitalize, AppLocalizations l10n) {
    final locVal = MatrixPuzzleEngine.localizeItem(l10n, val);
    if (cat == 'Name') return locVal;
    final article = _article(locVal);
    if (cat == 'Nationality') {
      return capitalize ? l10n.clueSubjectNationalityCap(locVal) : l10n.clueSubjectNationalityLow(locVal);
    }
    if (cat == 'Pet') {
      return capitalize ? l10n.clueSubjectPetCap(article, locVal) : l10n.clueSubjectPetLow(article, locVal);
    }
    if (cat == 'Hobby') {
      return capitalize ? l10n.clueSubjectHobbyCap(locVal) : l10n.clueSubjectHobbyLow(locVal);
    }
    if (cat == 'Drink') {
      return capitalize ? l10n.clueSubjectDrinkCap(locVal) : l10n.clueSubjectDrinkLow(locVal);
    }
    if (cat == 'Vehicle') {
      return capitalize ? l10n.clueSubjectVehicleCap(article, locVal) : l10n.clueSubjectVehicleLow(article, locVal);
    }
    if (cat == 'Instrument') {
      return capitalize ? l10n.clueSubjectInstrumentCap(locVal) : l10n.clueSubjectInstrumentLow(locVal);
    }
    if (cat == 'Color') {
      return capitalize ? l10n.clueSubjectColorCap(locVal) : l10n.clueSubjectColorLow(locVal);
    }
    return capitalize ? l10n.clueSubjectGenericCap(locVal) : l10n.clueSubjectGenericLow(locVal);
  }

  String toText(int floorsCount) {
    final subj1 = _subject(cat1, val1, capitalize: true);

    switch (type) {
      case _ClueKind.fixedFloor:
        final floorNum = floor! + 1;
        if (floorNum == 1) {
          return "$subj1 lives on the 1st floor (Ground floor).";
        } else if (floorNum == floorsCount) {
          return "$subj1 lives on the ${_ordinal(floorNum)} floor (Top floor).";
        } else {
          return "$subj1 lives on the ${_ordinal(floorNum)} floor.";
        }

      case _ClueKind.parityFloor:
        return isOdd! ? "$subj1 lives on an odd-numbered floor." : "$subj1 lives on an even-numbered floor.";

      case _ClueKind.sameFloor:
        return _formatSameFloor(cat1, val1, cat2!, val2!);

      case _ClueKind.negativeSameFloor:
        return _formatNegativeSameFloor(cat1, val1, cat2!, val2!);

      case _ClueKind.immediateAbove:
        final obj2 = _subject(cat2!, val2!, capitalize: false);
        return "$subj1 lives directly above $obj2.";

      case _ClueKind.somewhereAbove:
        final obj2 = _subject(cat2!, val2!, capitalize: false);
        return "$subj1 lives somewhere above $obj2.";

      case _ClueKind.adjacentFloor:
        final obj2 = _subject(cat2!, val2!, capitalize: false);
        return "$subj1 lives on a floor adjacent to $obj2.";

      case _ClueKind.distanceAbove:
        final obj2 = _subject(cat2!, val2!, capitalize: false);
        return "$subj1 lives exactly $distance floors above $obj2.";

      case _ClueKind.betweenFloors:
        final obj2 = _subject(cat2!, val2!, capitalize: false);
        final obj3 = _subject(cat3!, val3!, capitalize: false);
        return "$subj1 lives on a floor between $obj2 and $obj3.";
    }
  }

  static String _formatSameFloor(String c1, String v1, String c2, String v2) {
    final subj = _subject(c1, v1, capitalize: true);
    if (c1 == 'Name') {
      if (c2 == 'Pet') return "$v1 has ${_article(v2)} $v2.";
      if (c2 == 'Hobby') return "$v1 enjoys $v2.";
      if (c2 == 'Drink') return "$v1 drinks $v2.";
      if (c2 == 'Vehicle') return "$v1 drives ${_article(v2)} $v2.";
      if (c2 == 'Instrument') return "$v1 plays the $v2.";
      if (c2 == 'Color') return "$v1 has ${_article(v2)} $v2 door.";
      if (c2 == 'Profession') return "$v1 is ${_article(v2)} $v2.";
      if (c2 == 'Nationality') return "$v1 is $v2.";
    }
    final obj = _subject(c2, v2, capitalize: false);
    return "$subj shares a floor with $obj.";
  }

  static String _formatNegativeSameFloor(String c1, String v1, String c2, String v2) {
    final subj = _subject(c1, v1, capitalize: true);
    if (c1 == 'Name') {
      if (c2 == 'Pet') return "$v1 does not have ${_article(v2)} $v2.";
      if (c2 == 'Hobby') return "$v1 does not enjoy $v2.";
      if (c2 == 'Drink') return "$v1 does not drink $v2.";
      if (c2 == 'Vehicle') return "$v1 does not drive ${_article(v2)} $v2.";
      if (c2 == 'Instrument') return "$v1 does not play the $v2.";
      if (c2 == 'Color') return "$v1 does not have ${_article(v2)} $v2 door.";
      if (c2 == 'Profession') return "$v1 is not ${_article(v2)} $v2.";
      if (c2 == 'Nationality') return "$v1 is not $v2.";
    }
    final obj = _subject(c2, v2, capitalize: false);
    return "$subj does not live on the same floor as $obj.";
  }

  static String _subject(String cat, String val, {required bool capitalize}) {
    if (cat == 'Name') return val;
    if (cat == 'Nationality') return capitalize ? "The $val resident" : "the $val resident";
    if (cat == 'Pet') return capitalize ? "The person with ${_article(val)} $val" : "the person with ${_article(val)} $val";
    if (cat == 'Hobby') return capitalize ? "The person who enjoys $val" : "the person who enjoys $val";
    if (cat == 'Drink') return capitalize ? "The $val drinker" : "the $val drinker";
    if (cat == 'Vehicle') return capitalize ? "The person with ${_article(val)} $val" : "the person with ${_article(val)} $val";
    if (cat == 'Instrument') return capitalize ? "The $val player" : "the $val player";
    if (cat == 'Color') return capitalize ? "The resident with the $val door" : "the resident with the $val door";
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

class _FastMatrixSolver {
  final int n;
  final List<String> categories;
  final Map<String, List<String>> itemsByCategory;
  final Map<String, int> itemToVar;
  final int allMask;

  _FastMatrixSolver(this.n, this.categories, this.itemsByCategory)
      : allMask = (1 << n) - 1,
        itemToVar = {} {
    for (var c = 0; c < categories.length; c++) {
      final cat = categories[c];
      final items = itemsByCategory[cat]!;
      for (var i = 0; i < n; i++) {
        itemToVar['$cat:${items[i]}'] = c * n + i;
      }
    }
  }

  int countSolutions(List<_ClueConstraint> constraints, {int maxCount = 2}) {
    final numCats = categories.length;
    final totalVars = numCats * n;
    final domains = List<int>.filled(totalVars, allMask);

    for (final c in constraints) {
      if (c.type == _ClueKind.fixedFloor) {
        final v = itemToVar['${c.cat1}:${c.val1}']!;
        domains[v] &= (1 << c.floor!);
      } else if (c.type == _ClueKind.parityFloor) {
        final v = itemToVar['${c.cat1}:${c.val1}']!;
        int parityMask = 0;
        for (var f = 0; f < n; f++) {
          final floorNum = f + 1;
          if (c.isOdd! ? (floorNum % 2 == 1) : (floorNum % 2 == 0)) {
            parityMask |= (1 << f);
          }
        }
        domains[v] &= parityMask;
      }
    }

    final fastConstraints = <_FastConstraint>[];
    for (final c in constraints) {
      final v1 = itemToVar['${c.cat1}:${c.val1}']!;
      final v2 = (c.cat2 != null && c.val2 != null) ? itemToVar['${c.cat2!}:${c.val2!}']! : -1;
      final v3 = (c.cat3 != null && c.val3 != null) ? itemToVar['${c.cat3!}:${c.val3!}']! : -1;
      fastConstraints.add(_FastConstraint(c.type, v1, v2, v3, c.floor ?? -1, c.distance ?? 0, c.isOdd ?? false));
    }

    bool propagate(List<int> d) {
      bool changed = true;
      while (changed) {
        changed = false;
        for (var cat = 0; cat < numCats; cat++) {
          final offset = cat * n;
          int assignedMask = 0;
          for (var i = 0; i < n; i++) {
            final mask = d[offset + i];
            if (mask == 0) return false;
            if ((mask & (mask - 1)) == 0) {
              if ((assignedMask & mask) != 0) return false;
              assignedMask |= mask;
            }
          }
          for (var i = 0; i < n; i++) {
            final mask = d[offset + i];
            if ((mask & (mask - 1)) != 0) {
              final newMask = mask & ~assignedMask;
              if (newMask != mask) {
                if (newMask == 0) return false;
                d[offset + i] = newMask;
                changed = true;
              }
            }
          }
        }

        for (final fc in fastConstraints) {
          final v1 = fc.v1;
          final v2 = fc.v2;
          final v3 = fc.v3;
          final d1 = d[v1];
          if (v2 == -1) continue;
          final d2 = d[v2];

          int validD1 = 0;
          int validD2 = 0;
          int validD3 = (v3 != -1) ? 0 : -1;
          final d3 = (v3 != -1) ? d[v3] : 0;

          switch (fc.type) {
            case _ClueKind.sameFloor:
              validD1 = d1 & d2;
              validD2 = validD1;
              break;
            case _ClueKind.negativeSameFloor:
              if ((d2 & (d2 - 1)) == 0) {
                validD1 = d1 & ~d2;
              } else {
                validD1 = d1;
              }
              if ((d1 & (d1 - 1)) == 0) {
                validD2 = d2 & ~d1;
              } else {
                validD2 = d2;
              }
              break;
            case _ClueKind.immediateAbove:
              validD1 = d1 & (d2 << 1);
              validD2 = d2 & (d1 >> 1);
              break;
            case _ClueKind.somewhereAbove:
              int minD2 = d2 == 0 ? n : (d2 & -d2).bitLength - 1;
              int maxD1 = d1.bitLength - 1;
              validD1 = d1 & ~((1 << (minD2 + 1)) - 1);
              validD2 = d2 & ((1 << maxD1) - 1);
              break;
            case _ClueKind.adjacentFloor:
              validD1 = d1 & ((d2 << 1) | (d2 >> 1));
              validD2 = d2 & ((d1 << 1) | (d1 >> 1));
              break;
            case _ClueKind.distanceAbove:
              final dist = fc.distance;
              validD1 = d1 & (d2 << dist);
              validD2 = d2 & (d1 >> dist);
              break;
            case _ClueKind.betweenFloors:
              for (var f1 = 0; f1 < n; f1++) {
                if ((d1 & (1 << f1)) == 0) continue;
                for (var f2 = 0; f2 < n; f2++) {
                  if ((d2 & (1 << f2)) == 0) continue;
                  for (var f3 = 0; f3 < n; f3++) {
                    if ((d3 & (1 << f3)) == 0) continue;
                    if ((f2 < f1 && f1 < f3) || (f3 < f1 && f1 < f2)) {
                      validD1 |= (1 << f1);
                      validD2 |= (1 << f2);
                      validD3 |= (1 << f3);
                    }
                  }
                }
              }
              break;
            default:
              break;
          }

          if (validD1 == 0 || validD2 == 0 || (v3 != -1 && validD3 == 0)) return false;
          if (validD1 != d1) {
            d[v1] = validD1;
            changed = true;
          }
          if (validD2 != d2) {
            d[v2] = validD2;
            changed = true;
          }
          if (v3 != -1 && validD3 != d3) {
            d[v3] = validD3;
            changed = true;
          }
        }
      }
      return true;
    }

    if (!propagate(domains)) return 0;

    int solutions = 0;

    void search(int varIdx, List<int> d, List<int> assignedFloors) {
      if (solutions >= maxCount) return;
      if (varIdx == totalVars) {
        solutions++;
        return;
      }

      int bestVar = -1;
      int minChoices = 999;
      for (var v = 0; v < totalVars; v++) {
        if (assignedFloors[v] == -1) {
          int count = 0;
          var temp = d[v];
          while (temp > 0) {
            count += temp & 1;
            temp >>= 1;
          }
          if (count < minChoices) {
            minChoices = count;
            bestVar = v;
          }
        }
      }

      if (bestVar == -1) {
        solutions++;
        return;
      }

      final cat = bestVar ~/ n;
      final catOffset = cat * n;

      var available = d[bestVar];
      while (available > 0) {
        final f = available.bitLength - 1;
        final mask = 1 << f;
        available &= ~mask;

        bool floorConflict = false;
        for (var i = 0; i < n; i++) {
          if (assignedFloors[catOffset + i] == f) {
            floorConflict = true;
            break;
          }
        }
        if (floorConflict) continue;

        final nextD = List<int>.from(d);
        nextD[bestVar] = mask;
        if (propagate(nextD)) {
          assignedFloors[bestVar] = f;
          search(varIdx + 1, nextD, assignedFloors);
          assignedFloors[bestVar] = -1;
          if (solutions >= maxCount) return;
        }
      }
    }

    search(0, domains, List<int>.filled(totalVars, -1));
    return solutions;
  }
}

class _FastConstraint {
  final _ClueKind type;
  final int v1;
  final int v2;
  final int v3;
  final int floor;
  final int distance;
  final bool isOdd;

  _FastConstraint(this.type, this.v1, this.v2, this.v3, this.floor, this.distance, this.isOdd);
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
