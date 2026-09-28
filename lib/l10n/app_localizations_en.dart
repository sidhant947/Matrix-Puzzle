// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Matrix Puzzle';

  @override
  String get appSubtitle => 'A Logic Puzzle in the Skyscraper';

  @override
  String get play => 'Play';

  @override
  String get dailyChallenge => 'Daily Challenge';

  @override
  String get levels => 'Levels';

  @override
  String get randomPuzzle => 'Random Puzzle';

  @override
  String get howToPlay => 'How to Play';

  @override
  String get settings => 'Settings';

  @override
  String get selectDifficulty => 'Select Difficulty';

  @override
  String get difficultyEasy => 'Easy';

  @override
  String get difficultyMedium => 'Medium';

  @override
  String get difficultyHard => 'Hard';

  @override
  String get difficultyExpert => 'Expert';

  @override
  String floorsCount(int count) {
    return '$count Floors';
  }

  @override
  String levelTitle(int levelNumber) {
    return 'Level $levelNumber';
  }

  @override
  String get practiceBuilding => 'Practice Building';

  @override
  String get floor => 'Floor';

  @override
  String get floorGround => 'G';

  @override
  String get floorTop => 'T';

  @override
  String get categoryName => 'Name';

  @override
  String get categoryProfession => 'Profession';

  @override
  String get categoryPet => 'Pet';

  @override
  String get categoryHobby => 'Hobby';

  @override
  String get categoryDrink => 'Drink';

  @override
  String get categoryColor => 'Color';

  @override
  String get categoryVehicle => 'Vehicle';

  @override
  String get categoryInstrument => 'Instrument';

  @override
  String get categoryNationality => 'Nationality';

  @override
  String get notes => 'NOTES';

  @override
  String get notesHint => 'Write your notes or deductions here...';

  @override
  String get clues => 'CLUES';

  @override
  String get resetGame => 'Reset Game';

  @override
  String get resetGameConfirmation =>
      'Are you sure you want to reset the current game?';

  @override
  String get cancel => 'Cancel';

  @override
  String get reset => 'Reset';

  @override
  String get hint => 'Hint';

  @override
  String get tapACell => 'Tap a cell';

  @override
  String get undo => 'Undo';

  @override
  String get victoryMessage =>
      'Congratulations! You solved the puzzle correctly!';

  @override
  String get nextLevel => 'Next Level';

  @override
  String get mainMenu => 'Main Menu';

  @override
  String get buyMeACoffee => 'Buy me a coffee';

  @override
  String get checkSolution => 'Check Solution';

  @override
  String get incorrectSolution => 'Incorrect Solution';

  @override
  String get incorrectSolutionMessage =>
      'The solution is incorrect. Keep trying!';

  @override
  String get ok => 'OK';

  @override
  String get dailyCompletedMessage =>
      'You solved today\'s challenge! Come back tomorrow for a new one.';

  @override
  String get dailyInstructionMessage =>
      'Solve today\'s puzzle. Same grid and clues for all players today.';

  @override
  String get replayChallenge => 'Replay Challenge';

  @override
  String get playTodayRiddle => 'Play Today\'s Riddle';

  @override
  String get objectiveTitle => 'Objective';

  @override
  String get objectiveDescription =>
      'Matrix Puzzle is a deductive logic puzzle where you determine which resident lives on each floor of a building. Each puzzle features dynamic themes with different categories (such as Names, Pets, Hobbies, Drinks, Professions, Vehicles, Colors, Instruments, and Nationalities). Every floor has exactly one resident with one item from each category. Your goal is to deduce the full solution using the clues.';

  @override
  String get clueTypesTitle => 'Clue Types & Meanings';

  @override
  String get clueSectionDirectTitle => '1. Direct & Parity Clues';

  @override
  String get clueSectionDirectDesc =>
      'These identify exact floor positions or numerical properties.';

  @override
  String get exampleDirectClue1 =>
      'James lives on the 1st floor (Ground floor).';

  @override
  String get exampleDirectMeaning1 =>
      'James is on Floor 1. Tap the Name cell on Floor 1 and select \'James\'.';

  @override
  String get exampleDirectClue2 => 'The Doctor lives on an odd-numbered floor.';

  @override
  String get exampleDirectMeaning2 =>
      'The Doctor can only live on Floor 1, 3, 5, 7, etc.';

  @override
  String get clueSectionAssociationTitle => '2. Association & Negative Clues';

  @override
  String get clueSectionAssociationDesc =>
      'These link or separate two characteristics belonging to residents.';

  @override
  String get exampleAssocClue1 => 'Maria has a Cat.';

  @override
  String get exampleAssocMeaning1 => 'Maria and Cat belong on the same floor.';

  @override
  String get exampleAssocClue2 => 'Chen does not drink Coffee.';

  @override
  String get exampleAssocMeaning2 =>
      'Chen and Coffee cannot be on the same floor.';

  @override
  String get clueSectionNeighborTitle => '3. Neighbor & Relative Position';

  @override
  String get clueSectionNeighborDesc =>
      'These describe vertical positioning relationships between residents.';

  @override
  String get exampleNeighborClue1 => 'Yuki lives directly above Ahmed.';

  @override
  String get exampleNeighborMeaning1 =>
      'Yuki is on the immediate floor above Ahmed (Floor X + 1).';

  @override
  String get exampleNeighborClue2 =>
      'Sofia lives on a floor adjacent to Dmitri.';

  @override
  String get exampleNeighborMeaning2 =>
      'Sofia lives either directly above or directly below Dmitri (|Floor A - Floor B| = 1).';

  @override
  String get exampleNeighborClue3 =>
      'The Pilot lives somewhere above the Chef.';

  @override
  String get exampleNeighborMeaning3 =>
      'The Pilot lives on any higher floor than the Chef (Floor > X).';

  @override
  String get clueSectionDistanceTitle => '4. Distance & Betweenness Clues';

  @override
  String get clueSectionDistanceDesc =>
      'Advanced clues that specify relative gaps and sandwich arrangements.';

  @override
  String get exampleDistanceClue1 =>
      'Elena lives exactly 2 floors above Priya.';

  @override
  String get exampleDistanceMeaning1 =>
      'Elena\'s floor is exactly Priya\'s floor + 2 (e.g., Floors 1 and 3, or Floors 3 and 5).';

  @override
  String get exampleDistanceClue2 =>
      'Chen lives on a floor between Maria and the Architect.';

  @override
  String get exampleDistanceMeaning2 =>
      'Chen\'s floor is strictly between Maria\'s floor and the Architect\'s floor.';

  @override
  String get toolsAndControlsTitle => 'Tools & Controls';

  @override
  String get helpfulFeaturesTitle => 'Helpful Features';

  @override
  String get helpfulFeaturesDesc =>
      'Use these in-game tools to assist your deductions:';

  @override
  String get toolHintTitle => 'Hint Button (Above Grid)';

  @override
  String get toolHintDesc =>
      'Tap Hint and then tap any cell on the grid to reveal the correct value. You get 1 hint for 3-4 floor puzzles and 2 hints for 5+ floor puzzles.';

  @override
  String get toolUndoTitle => 'Undo Button (Above Grid)';

  @override
  String get toolUndoDesc =>
      'Tap Undo to revert your last cell placement or hint action.';

  @override
  String get toolCrossOutTitle => 'Cross Out Clues';

  @override
  String get toolCrossOutDesc =>
      'Tap any clue in the clue list to cross it out once you have applied its deduction.';

  @override
  String get toolNotesTitle => 'Notes FAB (Bottom Right)';

  @override
  String get toolNotesDesc =>
      'Tap the floating notes button to write down your own scratchpad deductions.';

  @override
  String get customizeBuildingSize => 'Customize Building Size';

  @override
  String floorsSliderLabel(int count) {
    return 'Floors: $count';
  }

  @override
  String get generatePracticeBuilding => 'Generate Practice Building';

  @override
  String get moveCrossedCluesToBottomTitle => 'Move Crossed Clues to Bottom';

  @override
  String get moveCrossedCluesToBottomSubtitle =>
      'When enabled, clues crossed off will move to the bottom of the list';

  @override
  String get autoCheckSolutionTitle => 'Auto Check Solution';

  @override
  String get autoCheckSolutionSubtitle =>
      'Automatically verify and complete the puzzle when correct, removing the Check Solution button';

  @override
  String clueFixedFloorGround(String subject) {
    return '$subject lives on the 1st floor (Ground floor).';
  }

  @override
  String clueFixedFloorTop(String subject, String ordinal) {
    return '$subject lives on the $ordinal floor (Top floor).';
  }

  @override
  String clueFixedFloor(String subject, String ordinal) {
    return '$subject lives on the $ordinal floor.';
  }

  @override
  String clueParityOdd(String subject) {
    return '$subject lives on an odd-numbered floor.';
  }

  @override
  String clueParityEven(String subject) {
    return '$subject lives on an even-numbered floor.';
  }

  @override
  String clueImmediateAbove(String subject1, String subject2) {
    return '$subject1 lives directly above $subject2.';
  }

  @override
  String clueSomewhereAbove(String subject1, String subject2) {
    return '$subject1 lives somewhere above $subject2.';
  }

  @override
  String clueAdjacent(String subject1, String subject2) {
    return '$subject1 lives on a floor adjacent to $subject2.';
  }

  @override
  String clueDistanceAbove(String subject1, String subject2, int distance) {
    return '$subject1 lives exactly $distance floors above $subject2.';
  }

  @override
  String clueBetween(String subject1, String subject2, String subject3) {
    return '$subject1 lives on a floor between $subject2 and $subject3.';
  }

  @override
  String clueSameFloorPet(String name, String article, String value) {
    return '$name has $article $value.';
  }

  @override
  String clueSameFloorHobby(String name, String value) {
    return '$name enjoys $value.';
  }

  @override
  String clueSameFloorDrink(String name, String value) {
    return '$name drinks $value.';
  }

  @override
  String clueSameFloorVehicle(String name, String article, String value) {
    return '$name drives $article $value.';
  }

  @override
  String clueSameFloorInstrument(String name, String value) {
    return '$name plays the $value.';
  }

  @override
  String clueSameFloorColor(String name, String article, String value) {
    return '$name has $article $value door.';
  }

  @override
  String clueSameFloorProfession(String name, String article, String value) {
    return '$name is $article $value.';
  }

  @override
  String clueSameFloorNationality(String name, String value) {
    return '$name is $value.';
  }

  @override
  String clueSameFloorGeneric(String subject1, String subject2) {
    return '$subject1 shares a floor with $subject2.';
  }

  @override
  String clueNegativeFloorPet(String name, String article, String value) {
    return '$name does not have $article $value.';
  }

  @override
  String clueNegativeFloorHobby(String name, String value) {
    return '$name does not enjoy $value.';
  }

  @override
  String clueNegativeFloorDrink(String name, String value) {
    return '$name does not drink $value.';
  }

  @override
  String clueNegativeFloorVehicle(String name, String article, String value) {
    return '$name does not drive $article $value.';
  }

  @override
  String clueNegativeFloorInstrument(String name, String value) {
    return '$name does not play the $value.';
  }

  @override
  String clueNegativeFloorColor(String name, String article, String value) {
    return '$name does not have $article $value door.';
  }

  @override
  String clueNegativeFloorProfession(
    String name,
    String article,
    String value,
  ) {
    return '$name is not $article $value.';
  }

  @override
  String clueNegativeFloorNationality(String name, String value) {
    return '$name is not $value.';
  }

  @override
  String clueNegativeFloorGeneric(String subject1, String subject2) {
    return '$subject1 does not live on the same floor as $subject2.';
  }

  @override
  String clueSubjectNationalityCap(String value) {
    return 'The $value resident';
  }

  @override
  String clueSubjectNationalityLow(String value) {
    return 'the $value resident';
  }

  @override
  String clueSubjectPetCap(String article, String value) {
    return 'The person with $article $value';
  }

  @override
  String clueSubjectPetLow(String article, String value) {
    return 'the person with $article $value';
  }

  @override
  String clueSubjectHobbyCap(String value) {
    return 'The person who enjoys $value';
  }

  @override
  String clueSubjectHobbyLow(String value) {
    return 'the person who enjoys $value';
  }

  @override
  String clueSubjectDrinkCap(String value) {
    return 'The $value drinker';
  }

  @override
  String clueSubjectDrinkLow(String value) {
    return 'the $value drinker';
  }

  @override
  String clueSubjectVehicleCap(String article, String value) {
    return 'The person with $article $value';
  }

  @override
  String clueSubjectVehicleLow(String article, String value) {
    return 'the person with $article $value';
  }

  @override
  String clueSubjectInstrumentCap(String value) {
    return 'The $value player';
  }

  @override
  String clueSubjectInstrumentLow(String value) {
    return 'the $value player';
  }

  @override
  String clueSubjectColorCap(String value) {
    return 'The resident with the $value door';
  }

  @override
  String clueSubjectColorLow(String value) {
    return 'the resident with the $value door';
  }

  @override
  String clueSubjectGenericCap(String value) {
    return 'The $value';
  }

  @override
  String clueSubjectGenericLow(String value) {
    return 'the $value';
  }

  @override
  String get itemJames => 'James';

  @override
  String get itemMaria => 'Maria';

  @override
  String get itemPriya => 'Priya';

  @override
  String get itemChen => 'Chen';

  @override
  String get itemElena => 'Elena';

  @override
  String get itemSofia => 'Sofia';

  @override
  String get itemAhmed => 'Ahmed';

  @override
  String get itemDmitri => 'Dmitri';

  @override
  String get itemYuki => 'Yuki';

  @override
  String get itemOmar => 'Omar';

  @override
  String get itemFatima => 'Fatima';

  @override
  String get itemAisha => 'Aisha';

  @override
  String get itemMei => 'Mei';

  @override
  String get itemChloe => 'Chloe';

  @override
  String get itemZara => 'Zara';

  @override
  String get itemLucia => 'Lucia';

  @override
  String get itemAmara => 'Amara';

  @override
  String get itemIngrid => 'Ingrid';

  @override
  String get itemAnanya => 'Ananya';

  @override
  String get itemLeila => 'Leila';

  @override
  String get itemDoctor => 'Doctor';

  @override
  String get itemEngineer => 'Engineer';

  @override
  String get itemTeacher => 'Teacher';

  @override
  String get itemArtist => 'Artist';

  @override
  String get itemLawyer => 'Lawyer';

  @override
  String get itemPilot => 'Pilot';

  @override
  String get itemChef => 'Chef';

  @override
  String get itemNurse => 'Nurse';

  @override
  String get itemArchitect => 'Architect';

  @override
  String get itemMusician => 'Musician';

  @override
  String get itemCat => 'Cat';

  @override
  String get itemDog => 'Dog';

  @override
  String get itemParrot => 'Parrot';

  @override
  String get itemHamster => 'Hamster';

  @override
  String get itemTurtle => 'Turtle';

  @override
  String get itemRabbit => 'Rabbit';

  @override
  String get itemIguana => 'Iguana';

  @override
  String get itemFerret => 'Ferret';

  @override
  String get itemFish => 'Fish';

  @override
  String get itemHedgehog => 'Hedgehog';

  @override
  String get itemGardening => 'Gardening';

  @override
  String get itemPhotography => 'Photography';

  @override
  String get itemChess => 'Chess';

  @override
  String get itemPainting => 'Painting';

  @override
  String get itemBaking => 'Baking';

  @override
  String get itemAstronomy => 'Astronomy';

  @override
  String get itemGaming => 'Gaming';

  @override
  String get itemHiking => 'Hiking';

  @override
  String get itemYoga => 'Yoga';

  @override
  String get itemOrigami => 'Origami';

  @override
  String get itemEspresso => 'Espresso';

  @override
  String get itemGreenTea => 'Green Tea';

  @override
  String get itemCocoa => 'Cocoa';

  @override
  String get itemLemonade => 'Lemonade';

  @override
  String get itemBoba => 'Boba';

  @override
  String get itemCappuccino => 'Cappuccino';

  @override
  String get itemSmoothie => 'Smoothie';

  @override
  String get itemChai => 'Chai';

  @override
  String get itemMilkshake => 'Milkshake';

  @override
  String get itemIcedCoffee => 'Iced Coffee';

  @override
  String get itemCrimson => 'Crimson';

  @override
  String get itemSapphire => 'Sapphire';

  @override
  String get itemEmerald => 'Emerald';

  @override
  String get itemAmber => 'Amber';

  @override
  String get itemViolet => 'Violet';

  @override
  String get itemCoral => 'Coral';

  @override
  String get itemTeal => 'Teal';

  @override
  String get itemGold => 'Gold';

  @override
  String get itemLavender => 'Lavender';

  @override
  String get itemTurquoise => 'Turquoise';

  @override
  String get itemBicycle => 'Bicycle';

  @override
  String get itemScooter => 'Scooter';

  @override
  String get itemElectricCar => 'Electric Car';

  @override
  String get itemVintageCar => 'Vintage Car';

  @override
  String get itemMotorcycle => 'Motorcycle';

  @override
  String get itemSkateboard => 'Skateboard';

  @override
  String get itemUnicycle => 'Unicycle';

  @override
  String get itemSegway => 'Segway';

  @override
  String get itemRollerblades => 'Rollerblades';

  @override
  String get itemMoped => 'Moped';

  @override
  String get itemPiano => 'Piano';

  @override
  String get itemGuitar => 'Guitar';

  @override
  String get itemViolin => 'Violin';

  @override
  String get itemDrums => 'Drums';

  @override
  String get itemFlute => 'Flute';

  @override
  String get itemSaxophone => 'Saxophone';

  @override
  String get itemCello => 'Cello';

  @override
  String get itemTrumpet => 'Trumpet';

  @override
  String get itemHarp => 'Harp';

  @override
  String get itemClarinet => 'Clarinet';

  @override
  String get itemAmerican => 'American';

  @override
  String get itemBrazilian => 'Brazilian';

  @override
  String get itemChinese => 'Chinese';

  @override
  String get itemJapanese => 'Japanese';

  @override
  String get itemEgyptian => 'Egyptian';

  @override
  String get itemSpanish => 'Spanish';

  @override
  String get itemRussian => 'Russian';

  @override
  String get itemIndian => 'Indian';

  @override
  String get itemMoroccan => 'Moroccan';

  @override
  String get itemItalian => 'Italian';
}
