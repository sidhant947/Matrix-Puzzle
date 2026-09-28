import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Matrix Puzzle'**
  String get appTitle;

  /// No description provided for @appSubtitle.
  ///
  /// In en, this message translates to:
  /// **'A Logic Puzzle in the Skyscraper'**
  String get appSubtitle;

  /// No description provided for @play.
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get play;

  /// No description provided for @dailyChallenge.
  ///
  /// In en, this message translates to:
  /// **'Daily Challenge'**
  String get dailyChallenge;

  /// No description provided for @levels.
  ///
  /// In en, this message translates to:
  /// **'Levels'**
  String get levels;

  /// No description provided for @randomPuzzle.
  ///
  /// In en, this message translates to:
  /// **'Random Puzzle'**
  String get randomPuzzle;

  /// No description provided for @howToPlay.
  ///
  /// In en, this message translates to:
  /// **'How to Play'**
  String get howToPlay;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @selectDifficulty.
  ///
  /// In en, this message translates to:
  /// **'Select Difficulty'**
  String get selectDifficulty;

  /// No description provided for @difficultyEasy.
  ///
  /// In en, this message translates to:
  /// **'Easy'**
  String get difficultyEasy;

  /// No description provided for @difficultyMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get difficultyMedium;

  /// No description provided for @difficultyHard.
  ///
  /// In en, this message translates to:
  /// **'Hard'**
  String get difficultyHard;

  /// No description provided for @difficultyExpert.
  ///
  /// In en, this message translates to:
  /// **'Expert'**
  String get difficultyExpert;

  /// No description provided for @floorsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} Floors'**
  String floorsCount(int count);

  /// No description provided for @levelTitle.
  ///
  /// In en, this message translates to:
  /// **'Level {levelNumber}'**
  String levelTitle(int levelNumber);

  /// No description provided for @practiceBuilding.
  ///
  /// In en, this message translates to:
  /// **'Practice Building'**
  String get practiceBuilding;

  /// No description provided for @floor.
  ///
  /// In en, this message translates to:
  /// **'Floor'**
  String get floor;

  /// No description provided for @floorGround.
  ///
  /// In en, this message translates to:
  /// **'G'**
  String get floorGround;

  /// No description provided for @floorTop.
  ///
  /// In en, this message translates to:
  /// **'T'**
  String get floorTop;

  /// No description provided for @categoryName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get categoryName;

  /// No description provided for @categoryProfession.
  ///
  /// In en, this message translates to:
  /// **'Profession'**
  String get categoryProfession;

  /// No description provided for @categoryPet.
  ///
  /// In en, this message translates to:
  /// **'Pet'**
  String get categoryPet;

  /// No description provided for @categoryHobby.
  ///
  /// In en, this message translates to:
  /// **'Hobby'**
  String get categoryHobby;

  /// No description provided for @categoryDrink.
  ///
  /// In en, this message translates to:
  /// **'Drink'**
  String get categoryDrink;

  /// No description provided for @categoryColor.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get categoryColor;

  /// No description provided for @categoryVehicle.
  ///
  /// In en, this message translates to:
  /// **'Vehicle'**
  String get categoryVehicle;

  /// No description provided for @categoryInstrument.
  ///
  /// In en, this message translates to:
  /// **'Instrument'**
  String get categoryInstrument;

  /// No description provided for @categoryNationality.
  ///
  /// In en, this message translates to:
  /// **'Nationality'**
  String get categoryNationality;

  /// No description provided for @notes.
  ///
  /// In en, this message translates to:
  /// **'NOTES'**
  String get notes;

  /// No description provided for @notesHint.
  ///
  /// In en, this message translates to:
  /// **'Write your notes or deductions here...'**
  String get notesHint;

  /// No description provided for @clues.
  ///
  /// In en, this message translates to:
  /// **'CLUES'**
  String get clues;

  /// No description provided for @resetGame.
  ///
  /// In en, this message translates to:
  /// **'Reset Game'**
  String get resetGame;

  /// No description provided for @resetGameConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to reset the current game?'**
  String get resetGameConfirmation;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @hint.
  ///
  /// In en, this message translates to:
  /// **'Hint'**
  String get hint;

  /// No description provided for @tapACell.
  ///
  /// In en, this message translates to:
  /// **'Tap a cell'**
  String get tapACell;

  /// No description provided for @undo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get undo;

  /// No description provided for @victoryMessage.
  ///
  /// In en, this message translates to:
  /// **'Congratulations! You solved the puzzle correctly!'**
  String get victoryMessage;

  /// No description provided for @nextLevel.
  ///
  /// In en, this message translates to:
  /// **'Next Level'**
  String get nextLevel;

  /// No description provided for @mainMenu.
  ///
  /// In en, this message translates to:
  /// **'Main Menu'**
  String get mainMenu;

  /// No description provided for @buyMeACoffee.
  ///
  /// In en, this message translates to:
  /// **'Buy me a coffee'**
  String get buyMeACoffee;

  /// No description provided for @checkSolution.
  ///
  /// In en, this message translates to:
  /// **'Check Solution'**
  String get checkSolution;

  /// No description provided for @incorrectSolution.
  ///
  /// In en, this message translates to:
  /// **'Incorrect Solution'**
  String get incorrectSolution;

  /// No description provided for @incorrectSolutionMessage.
  ///
  /// In en, this message translates to:
  /// **'The solution is incorrect. Keep trying!'**
  String get incorrectSolutionMessage;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @dailyCompletedMessage.
  ///
  /// In en, this message translates to:
  /// **'You solved today\'s challenge! Come back tomorrow for a new one.'**
  String get dailyCompletedMessage;

  /// No description provided for @dailyInstructionMessage.
  ///
  /// In en, this message translates to:
  /// **'Solve today\'s puzzle. Same grid and clues for all players today.'**
  String get dailyInstructionMessage;

  /// No description provided for @replayChallenge.
  ///
  /// In en, this message translates to:
  /// **'Replay Challenge'**
  String get replayChallenge;

  /// No description provided for @playTodayRiddle.
  ///
  /// In en, this message translates to:
  /// **'Play Today\'s Riddle'**
  String get playTodayRiddle;

  /// No description provided for @objectiveTitle.
  ///
  /// In en, this message translates to:
  /// **'Objective'**
  String get objectiveTitle;

  /// No description provided for @objectiveDescription.
  ///
  /// In en, this message translates to:
  /// **'Matrix Puzzle is a deductive logic puzzle where you determine which resident lives on each floor of a building. Each puzzle features dynamic themes with different categories (such as Names, Pets, Hobbies, Drinks, Professions, Vehicles, Colors, Instruments, and Nationalities). Every floor has exactly one resident with one item from each category. Your goal is to deduce the full solution using the clues.'**
  String get objectiveDescription;

  /// No description provided for @clueTypesTitle.
  ///
  /// In en, this message translates to:
  /// **'Clue Types & Meanings'**
  String get clueTypesTitle;

  /// No description provided for @clueSectionDirectTitle.
  ///
  /// In en, this message translates to:
  /// **'1. Direct & Parity Clues'**
  String get clueSectionDirectTitle;

  /// No description provided for @clueSectionDirectDesc.
  ///
  /// In en, this message translates to:
  /// **'These identify exact floor positions or numerical properties.'**
  String get clueSectionDirectDesc;

  /// No description provided for @exampleDirectClue1.
  ///
  /// In en, this message translates to:
  /// **'James lives on the 1st floor (Ground floor).'**
  String get exampleDirectClue1;

  /// No description provided for @exampleDirectMeaning1.
  ///
  /// In en, this message translates to:
  /// **'James is on Floor 1. Tap the Name cell on Floor 1 and select \'James\'.'**
  String get exampleDirectMeaning1;

  /// No description provided for @exampleDirectClue2.
  ///
  /// In en, this message translates to:
  /// **'The Doctor lives on an odd-numbered floor.'**
  String get exampleDirectClue2;

  /// No description provided for @exampleDirectMeaning2.
  ///
  /// In en, this message translates to:
  /// **'The Doctor can only live on Floor 1, 3, 5, 7, etc.'**
  String get exampleDirectMeaning2;

  /// No description provided for @clueSectionAssociationTitle.
  ///
  /// In en, this message translates to:
  /// **'2. Association & Negative Clues'**
  String get clueSectionAssociationTitle;

  /// No description provided for @clueSectionAssociationDesc.
  ///
  /// In en, this message translates to:
  /// **'These link or separate two characteristics belonging to residents.'**
  String get clueSectionAssociationDesc;

  /// No description provided for @exampleAssocClue1.
  ///
  /// In en, this message translates to:
  /// **'Maria has a Cat.'**
  String get exampleAssocClue1;

  /// No description provided for @exampleAssocMeaning1.
  ///
  /// In en, this message translates to:
  /// **'Maria and Cat belong on the same floor.'**
  String get exampleAssocMeaning1;

  /// No description provided for @exampleAssocClue2.
  ///
  /// In en, this message translates to:
  /// **'Chen does not drink Coffee.'**
  String get exampleAssocClue2;

  /// No description provided for @exampleAssocMeaning2.
  ///
  /// In en, this message translates to:
  /// **'Chen and Coffee cannot be on the same floor.'**
  String get exampleAssocMeaning2;

  /// No description provided for @clueSectionNeighborTitle.
  ///
  /// In en, this message translates to:
  /// **'3. Neighbor & Relative Position'**
  String get clueSectionNeighborTitle;

  /// No description provided for @clueSectionNeighborDesc.
  ///
  /// In en, this message translates to:
  /// **'These describe vertical positioning relationships between residents.'**
  String get clueSectionNeighborDesc;

  /// No description provided for @exampleNeighborClue1.
  ///
  /// In en, this message translates to:
  /// **'Yuki lives directly above Ahmed.'**
  String get exampleNeighborClue1;

  /// No description provided for @exampleNeighborMeaning1.
  ///
  /// In en, this message translates to:
  /// **'Yuki is on the immediate floor above Ahmed (Floor X + 1).'**
  String get exampleNeighborMeaning1;

  /// No description provided for @exampleNeighborClue2.
  ///
  /// In en, this message translates to:
  /// **'Sofia lives on a floor adjacent to Dmitri.'**
  String get exampleNeighborClue2;

  /// No description provided for @exampleNeighborMeaning2.
  ///
  /// In en, this message translates to:
  /// **'Sofia lives either directly above or directly below Dmitri (|Floor A - Floor B| = 1).'**
  String get exampleNeighborMeaning2;

  /// No description provided for @exampleNeighborClue3.
  ///
  /// In en, this message translates to:
  /// **'The Pilot lives somewhere above the Chef.'**
  String get exampleNeighborClue3;

  /// No description provided for @exampleNeighborMeaning3.
  ///
  /// In en, this message translates to:
  /// **'The Pilot lives on any higher floor than the Chef (Floor > X).'**
  String get exampleNeighborMeaning3;

  /// No description provided for @clueSectionDistanceTitle.
  ///
  /// In en, this message translates to:
  /// **'4. Distance & Betweenness Clues'**
  String get clueSectionDistanceTitle;

  /// No description provided for @clueSectionDistanceDesc.
  ///
  /// In en, this message translates to:
  /// **'Advanced clues that specify relative gaps and sandwich arrangements.'**
  String get clueSectionDistanceDesc;

  /// No description provided for @exampleDistanceClue1.
  ///
  /// In en, this message translates to:
  /// **'Elena lives exactly 2 floors above Priya.'**
  String get exampleDistanceClue1;

  /// No description provided for @exampleDistanceMeaning1.
  ///
  /// In en, this message translates to:
  /// **'Elena\'s floor is exactly Priya\'s floor + 2 (e.g., Floors 1 and 3, or Floors 3 and 5).'**
  String get exampleDistanceMeaning1;

  /// No description provided for @exampleDistanceClue2.
  ///
  /// In en, this message translates to:
  /// **'Chen lives on a floor between Maria and the Architect.'**
  String get exampleDistanceClue2;

  /// No description provided for @exampleDistanceMeaning2.
  ///
  /// In en, this message translates to:
  /// **'Chen\'s floor is strictly between Maria\'s floor and the Architect\'s floor.'**
  String get exampleDistanceMeaning2;

  /// No description provided for @toolsAndControlsTitle.
  ///
  /// In en, this message translates to:
  /// **'Tools & Controls'**
  String get toolsAndControlsTitle;

  /// No description provided for @helpfulFeaturesTitle.
  ///
  /// In en, this message translates to:
  /// **'Helpful Features'**
  String get helpfulFeaturesTitle;

  /// No description provided for @helpfulFeaturesDesc.
  ///
  /// In en, this message translates to:
  /// **'Use these in-game tools to assist your deductions:'**
  String get helpfulFeaturesDesc;

  /// No description provided for @toolHintTitle.
  ///
  /// In en, this message translates to:
  /// **'Hint Button (Above Grid)'**
  String get toolHintTitle;

  /// No description provided for @toolHintDesc.
  ///
  /// In en, this message translates to:
  /// **'Tap Hint and then tap any cell on the grid to reveal the correct value. You get 1 hint for 3-4 floor puzzles and 2 hints for 5+ floor puzzles.'**
  String get toolHintDesc;

  /// No description provided for @toolUndoTitle.
  ///
  /// In en, this message translates to:
  /// **'Undo Button (Above Grid)'**
  String get toolUndoTitle;

  /// No description provided for @toolUndoDesc.
  ///
  /// In en, this message translates to:
  /// **'Tap Undo to revert your last cell placement or hint action.'**
  String get toolUndoDesc;

  /// No description provided for @toolCrossOutTitle.
  ///
  /// In en, this message translates to:
  /// **'Cross Out Clues'**
  String get toolCrossOutTitle;

  /// No description provided for @toolCrossOutDesc.
  ///
  /// In en, this message translates to:
  /// **'Tap any clue in the clue list to cross it out once you have applied its deduction.'**
  String get toolCrossOutDesc;

  /// No description provided for @toolNotesTitle.
  ///
  /// In en, this message translates to:
  /// **'Notes FAB (Bottom Right)'**
  String get toolNotesTitle;

  /// No description provided for @toolNotesDesc.
  ///
  /// In en, this message translates to:
  /// **'Tap the floating notes button to write down your own scratchpad deductions.'**
  String get toolNotesDesc;

  /// No description provided for @customizeBuildingSize.
  ///
  /// In en, this message translates to:
  /// **'Customize Building Size'**
  String get customizeBuildingSize;

  /// No description provided for @floorsSliderLabel.
  ///
  /// In en, this message translates to:
  /// **'Floors: {count}'**
  String floorsSliderLabel(int count);

  /// No description provided for @generatePracticeBuilding.
  ///
  /// In en, this message translates to:
  /// **'Generate Practice Building'**
  String get generatePracticeBuilding;

  /// No description provided for @moveCrossedCluesToBottomTitle.
  ///
  /// In en, this message translates to:
  /// **'Move Crossed Clues to Bottom'**
  String get moveCrossedCluesToBottomTitle;

  /// No description provided for @moveCrossedCluesToBottomSubtitle.
  ///
  /// In en, this message translates to:
  /// **'When enabled, clues crossed off will move to the bottom of the list'**
  String get moveCrossedCluesToBottomSubtitle;

  /// No description provided for @autoCheckSolutionTitle.
  ///
  /// In en, this message translates to:
  /// **'Auto Check Solution'**
  String get autoCheckSolutionTitle;

  /// No description provided for @autoCheckSolutionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Automatically verify and complete the puzzle when correct, removing the Check Solution button'**
  String get autoCheckSolutionSubtitle;

  /// No description provided for @clueFixedFloorGround.
  ///
  /// In en, this message translates to:
  /// **'{subject} lives on the 1st floor (Ground floor).'**
  String clueFixedFloorGround(String subject);

  /// No description provided for @clueFixedFloorTop.
  ///
  /// In en, this message translates to:
  /// **'{subject} lives on the {ordinal} floor (Top floor).'**
  String clueFixedFloorTop(String subject, String ordinal);

  /// No description provided for @clueFixedFloor.
  ///
  /// In en, this message translates to:
  /// **'{subject} lives on the {ordinal} floor.'**
  String clueFixedFloor(String subject, String ordinal);

  /// No description provided for @clueParityOdd.
  ///
  /// In en, this message translates to:
  /// **'{subject} lives on an odd-numbered floor.'**
  String clueParityOdd(String subject);

  /// No description provided for @clueParityEven.
  ///
  /// In en, this message translates to:
  /// **'{subject} lives on an even-numbered floor.'**
  String clueParityEven(String subject);

  /// No description provided for @clueImmediateAbove.
  ///
  /// In en, this message translates to:
  /// **'{subject1} lives directly above {subject2}.'**
  String clueImmediateAbove(String subject1, String subject2);

  /// No description provided for @clueSomewhereAbove.
  ///
  /// In en, this message translates to:
  /// **'{subject1} lives somewhere above {subject2}.'**
  String clueSomewhereAbove(String subject1, String subject2);

  /// No description provided for @clueAdjacent.
  ///
  /// In en, this message translates to:
  /// **'{subject1} lives on a floor adjacent to {subject2}.'**
  String clueAdjacent(String subject1, String subject2);

  /// No description provided for @clueDistanceAbove.
  ///
  /// In en, this message translates to:
  /// **'{subject1} lives exactly {distance} floors above {subject2}.'**
  String clueDistanceAbove(String subject1, String subject2, int distance);

  /// No description provided for @clueBetween.
  ///
  /// In en, this message translates to:
  /// **'{subject1} lives on a floor between {subject2} and {subject3}.'**
  String clueBetween(String subject1, String subject2, String subject3);

  /// No description provided for @clueSameFloorPet.
  ///
  /// In en, this message translates to:
  /// **'{name} has {article} {value}.'**
  String clueSameFloorPet(String name, String article, String value);

  /// No description provided for @clueSameFloorHobby.
  ///
  /// In en, this message translates to:
  /// **'{name} enjoys {value}.'**
  String clueSameFloorHobby(String name, String value);

  /// No description provided for @clueSameFloorDrink.
  ///
  /// In en, this message translates to:
  /// **'{name} drinks {value}.'**
  String clueSameFloorDrink(String name, String value);

  /// No description provided for @clueSameFloorVehicle.
  ///
  /// In en, this message translates to:
  /// **'{name} drives {article} {value}.'**
  String clueSameFloorVehicle(String name, String article, String value);

  /// No description provided for @clueSameFloorInstrument.
  ///
  /// In en, this message translates to:
  /// **'{name} plays the {value}.'**
  String clueSameFloorInstrument(String name, String value);

  /// No description provided for @clueSameFloorColor.
  ///
  /// In en, this message translates to:
  /// **'{name} has {article} {value} door.'**
  String clueSameFloorColor(String name, String article, String value);

  /// No description provided for @clueSameFloorProfession.
  ///
  /// In en, this message translates to:
  /// **'{name} is {article} {value}.'**
  String clueSameFloorProfession(String name, String article, String value);

  /// No description provided for @clueSameFloorNationality.
  ///
  /// In en, this message translates to:
  /// **'{name} is {value}.'**
  String clueSameFloorNationality(String name, String value);

  /// No description provided for @clueSameFloorGeneric.
  ///
  /// In en, this message translates to:
  /// **'{subject1} shares a floor with {subject2}.'**
  String clueSameFloorGeneric(String subject1, String subject2);

  /// No description provided for @clueNegativeFloorPet.
  ///
  /// In en, this message translates to:
  /// **'{name} does not have {article} {value}.'**
  String clueNegativeFloorPet(String name, String article, String value);

  /// No description provided for @clueNegativeFloorHobby.
  ///
  /// In en, this message translates to:
  /// **'{name} does not enjoy {value}.'**
  String clueNegativeFloorHobby(String name, String value);

  /// No description provided for @clueNegativeFloorDrink.
  ///
  /// In en, this message translates to:
  /// **'{name} does not drink {value}.'**
  String clueNegativeFloorDrink(String name, String value);

  /// No description provided for @clueNegativeFloorVehicle.
  ///
  /// In en, this message translates to:
  /// **'{name} does not drive {article} {value}.'**
  String clueNegativeFloorVehicle(String name, String article, String value);

  /// No description provided for @clueNegativeFloorInstrument.
  ///
  /// In en, this message translates to:
  /// **'{name} does not play the {value}.'**
  String clueNegativeFloorInstrument(String name, String value);

  /// No description provided for @clueNegativeFloorColor.
  ///
  /// In en, this message translates to:
  /// **'{name} does not have {article} {value} door.'**
  String clueNegativeFloorColor(String name, String article, String value);

  /// No description provided for @clueNegativeFloorProfession.
  ///
  /// In en, this message translates to:
  /// **'{name} is not {article} {value}.'**
  String clueNegativeFloorProfession(String name, String article, String value);

  /// No description provided for @clueNegativeFloorNationality.
  ///
  /// In en, this message translates to:
  /// **'{name} is not {value}.'**
  String clueNegativeFloorNationality(String name, String value);

  /// No description provided for @clueNegativeFloorGeneric.
  ///
  /// In en, this message translates to:
  /// **'{subject1} does not live on the same floor as {subject2}.'**
  String clueNegativeFloorGeneric(String subject1, String subject2);

  /// No description provided for @clueSubjectNationalityCap.
  ///
  /// In en, this message translates to:
  /// **'The {value} resident'**
  String clueSubjectNationalityCap(String value);

  /// No description provided for @clueSubjectNationalityLow.
  ///
  /// In en, this message translates to:
  /// **'the {value} resident'**
  String clueSubjectNationalityLow(String value);

  /// No description provided for @clueSubjectPetCap.
  ///
  /// In en, this message translates to:
  /// **'The person with {article} {value}'**
  String clueSubjectPetCap(String article, String value);

  /// No description provided for @clueSubjectPetLow.
  ///
  /// In en, this message translates to:
  /// **'the person with {article} {value}'**
  String clueSubjectPetLow(String article, String value);

  /// No description provided for @clueSubjectHobbyCap.
  ///
  /// In en, this message translates to:
  /// **'The person who enjoys {value}'**
  String clueSubjectHobbyCap(String value);

  /// No description provided for @clueSubjectHobbyLow.
  ///
  /// In en, this message translates to:
  /// **'the person who enjoys {value}'**
  String clueSubjectHobbyLow(String value);

  /// No description provided for @clueSubjectDrinkCap.
  ///
  /// In en, this message translates to:
  /// **'The {value} drinker'**
  String clueSubjectDrinkCap(String value);

  /// No description provided for @clueSubjectDrinkLow.
  ///
  /// In en, this message translates to:
  /// **'the {value} drinker'**
  String clueSubjectDrinkLow(String value);

  /// No description provided for @clueSubjectVehicleCap.
  ///
  /// In en, this message translates to:
  /// **'The person with {article} {value}'**
  String clueSubjectVehicleCap(String article, String value);

  /// No description provided for @clueSubjectVehicleLow.
  ///
  /// In en, this message translates to:
  /// **'the person with {article} {value}'**
  String clueSubjectVehicleLow(String article, String value);

  /// No description provided for @clueSubjectInstrumentCap.
  ///
  /// In en, this message translates to:
  /// **'The {value} player'**
  String clueSubjectInstrumentCap(String value);

  /// No description provided for @clueSubjectInstrumentLow.
  ///
  /// In en, this message translates to:
  /// **'the {value} player'**
  String clueSubjectInstrumentLow(String value);

  /// No description provided for @clueSubjectColorCap.
  ///
  /// In en, this message translates to:
  /// **'The resident with the {value} door'**
  String clueSubjectColorCap(String value);

  /// No description provided for @clueSubjectColorLow.
  ///
  /// In en, this message translates to:
  /// **'the resident with the {value} door'**
  String clueSubjectColorLow(String value);

  /// No description provided for @clueSubjectGenericCap.
  ///
  /// In en, this message translates to:
  /// **'The {value}'**
  String clueSubjectGenericCap(String value);

  /// No description provided for @clueSubjectGenericLow.
  ///
  /// In en, this message translates to:
  /// **'the {value}'**
  String clueSubjectGenericLow(String value);

  /// No description provided for @itemJames.
  ///
  /// In en, this message translates to:
  /// **'James'**
  String get itemJames;

  /// No description provided for @itemMaria.
  ///
  /// In en, this message translates to:
  /// **'Maria'**
  String get itemMaria;

  /// No description provided for @itemPriya.
  ///
  /// In en, this message translates to:
  /// **'Priya'**
  String get itemPriya;

  /// No description provided for @itemChen.
  ///
  /// In en, this message translates to:
  /// **'Chen'**
  String get itemChen;

  /// No description provided for @itemElena.
  ///
  /// In en, this message translates to:
  /// **'Elena'**
  String get itemElena;

  /// No description provided for @itemSofia.
  ///
  /// In en, this message translates to:
  /// **'Sofia'**
  String get itemSofia;

  /// No description provided for @itemAhmed.
  ///
  /// In en, this message translates to:
  /// **'Ahmed'**
  String get itemAhmed;

  /// No description provided for @itemDmitri.
  ///
  /// In en, this message translates to:
  /// **'Dmitri'**
  String get itemDmitri;

  /// No description provided for @itemYuki.
  ///
  /// In en, this message translates to:
  /// **'Yuki'**
  String get itemYuki;

  /// No description provided for @itemOmar.
  ///
  /// In en, this message translates to:
  /// **'Omar'**
  String get itemOmar;

  /// No description provided for @itemFatima.
  ///
  /// In en, this message translates to:
  /// **'Fatima'**
  String get itemFatima;

  /// No description provided for @itemAisha.
  ///
  /// In en, this message translates to:
  /// **'Aisha'**
  String get itemAisha;

  /// No description provided for @itemMei.
  ///
  /// In en, this message translates to:
  /// **'Mei'**
  String get itemMei;

  /// No description provided for @itemChloe.
  ///
  /// In en, this message translates to:
  /// **'Chloe'**
  String get itemChloe;

  /// No description provided for @itemZara.
  ///
  /// In en, this message translates to:
  /// **'Zara'**
  String get itemZara;

  /// No description provided for @itemLucia.
  ///
  /// In en, this message translates to:
  /// **'Lucia'**
  String get itemLucia;

  /// No description provided for @itemAmara.
  ///
  /// In en, this message translates to:
  /// **'Amara'**
  String get itemAmara;

  /// No description provided for @itemIngrid.
  ///
  /// In en, this message translates to:
  /// **'Ingrid'**
  String get itemIngrid;

  /// No description provided for @itemAnanya.
  ///
  /// In en, this message translates to:
  /// **'Ananya'**
  String get itemAnanya;

  /// No description provided for @itemLeila.
  ///
  /// In en, this message translates to:
  /// **'Leila'**
  String get itemLeila;

  /// No description provided for @itemDoctor.
  ///
  /// In en, this message translates to:
  /// **'Doctor'**
  String get itemDoctor;

  /// No description provided for @itemEngineer.
  ///
  /// In en, this message translates to:
  /// **'Engineer'**
  String get itemEngineer;

  /// No description provided for @itemTeacher.
  ///
  /// In en, this message translates to:
  /// **'Teacher'**
  String get itemTeacher;

  /// No description provided for @itemArtist.
  ///
  /// In en, this message translates to:
  /// **'Artist'**
  String get itemArtist;

  /// No description provided for @itemLawyer.
  ///
  /// In en, this message translates to:
  /// **'Lawyer'**
  String get itemLawyer;

  /// No description provided for @itemPilot.
  ///
  /// In en, this message translates to:
  /// **'Pilot'**
  String get itemPilot;

  /// No description provided for @itemChef.
  ///
  /// In en, this message translates to:
  /// **'Chef'**
  String get itemChef;

  /// No description provided for @itemNurse.
  ///
  /// In en, this message translates to:
  /// **'Nurse'**
  String get itemNurse;

  /// No description provided for @itemArchitect.
  ///
  /// In en, this message translates to:
  /// **'Architect'**
  String get itemArchitect;

  /// No description provided for @itemMusician.
  ///
  /// In en, this message translates to:
  /// **'Musician'**
  String get itemMusician;

  /// No description provided for @itemCat.
  ///
  /// In en, this message translates to:
  /// **'Cat'**
  String get itemCat;

  /// No description provided for @itemDog.
  ///
  /// In en, this message translates to:
  /// **'Dog'**
  String get itemDog;

  /// No description provided for @itemParrot.
  ///
  /// In en, this message translates to:
  /// **'Parrot'**
  String get itemParrot;

  /// No description provided for @itemHamster.
  ///
  /// In en, this message translates to:
  /// **'Hamster'**
  String get itemHamster;

  /// No description provided for @itemTurtle.
  ///
  /// In en, this message translates to:
  /// **'Turtle'**
  String get itemTurtle;

  /// No description provided for @itemRabbit.
  ///
  /// In en, this message translates to:
  /// **'Rabbit'**
  String get itemRabbit;

  /// No description provided for @itemIguana.
  ///
  /// In en, this message translates to:
  /// **'Iguana'**
  String get itemIguana;

  /// No description provided for @itemFerret.
  ///
  /// In en, this message translates to:
  /// **'Ferret'**
  String get itemFerret;

  /// No description provided for @itemFish.
  ///
  /// In en, this message translates to:
  /// **'Fish'**
  String get itemFish;

  /// No description provided for @itemHedgehog.
  ///
  /// In en, this message translates to:
  /// **'Hedgehog'**
  String get itemHedgehog;

  /// No description provided for @itemGardening.
  ///
  /// In en, this message translates to:
  /// **'Gardening'**
  String get itemGardening;

  /// No description provided for @itemPhotography.
  ///
  /// In en, this message translates to:
  /// **'Photography'**
  String get itemPhotography;

  /// No description provided for @itemChess.
  ///
  /// In en, this message translates to:
  /// **'Chess'**
  String get itemChess;

  /// No description provided for @itemPainting.
  ///
  /// In en, this message translates to:
  /// **'Painting'**
  String get itemPainting;

  /// No description provided for @itemBaking.
  ///
  /// In en, this message translates to:
  /// **'Baking'**
  String get itemBaking;

  /// No description provided for @itemAstronomy.
  ///
  /// In en, this message translates to:
  /// **'Astronomy'**
  String get itemAstronomy;

  /// No description provided for @itemGaming.
  ///
  /// In en, this message translates to:
  /// **'Gaming'**
  String get itemGaming;

  /// No description provided for @itemHiking.
  ///
  /// In en, this message translates to:
  /// **'Hiking'**
  String get itemHiking;

  /// No description provided for @itemYoga.
  ///
  /// In en, this message translates to:
  /// **'Yoga'**
  String get itemYoga;

  /// No description provided for @itemOrigami.
  ///
  /// In en, this message translates to:
  /// **'Origami'**
  String get itemOrigami;

  /// No description provided for @itemEspresso.
  ///
  /// In en, this message translates to:
  /// **'Espresso'**
  String get itemEspresso;

  /// No description provided for @itemGreenTea.
  ///
  /// In en, this message translates to:
  /// **'Green Tea'**
  String get itemGreenTea;

  /// No description provided for @itemCocoa.
  ///
  /// In en, this message translates to:
  /// **'Cocoa'**
  String get itemCocoa;

  /// No description provided for @itemLemonade.
  ///
  /// In en, this message translates to:
  /// **'Lemonade'**
  String get itemLemonade;

  /// No description provided for @itemBoba.
  ///
  /// In en, this message translates to:
  /// **'Boba'**
  String get itemBoba;

  /// No description provided for @itemCappuccino.
  ///
  /// In en, this message translates to:
  /// **'Cappuccino'**
  String get itemCappuccino;

  /// No description provided for @itemSmoothie.
  ///
  /// In en, this message translates to:
  /// **'Smoothie'**
  String get itemSmoothie;

  /// No description provided for @itemChai.
  ///
  /// In en, this message translates to:
  /// **'Chai'**
  String get itemChai;

  /// No description provided for @itemMilkshake.
  ///
  /// In en, this message translates to:
  /// **'Milkshake'**
  String get itemMilkshake;

  /// No description provided for @itemIcedCoffee.
  ///
  /// In en, this message translates to:
  /// **'Iced Coffee'**
  String get itemIcedCoffee;

  /// No description provided for @itemCrimson.
  ///
  /// In en, this message translates to:
  /// **'Crimson'**
  String get itemCrimson;

  /// No description provided for @itemSapphire.
  ///
  /// In en, this message translates to:
  /// **'Sapphire'**
  String get itemSapphire;

  /// No description provided for @itemEmerald.
  ///
  /// In en, this message translates to:
  /// **'Emerald'**
  String get itemEmerald;

  /// No description provided for @itemAmber.
  ///
  /// In en, this message translates to:
  /// **'Amber'**
  String get itemAmber;

  /// No description provided for @itemViolet.
  ///
  /// In en, this message translates to:
  /// **'Violet'**
  String get itemViolet;

  /// No description provided for @itemCoral.
  ///
  /// In en, this message translates to:
  /// **'Coral'**
  String get itemCoral;

  /// No description provided for @itemTeal.
  ///
  /// In en, this message translates to:
  /// **'Teal'**
  String get itemTeal;

  /// No description provided for @itemGold.
  ///
  /// In en, this message translates to:
  /// **'Gold'**
  String get itemGold;

  /// No description provided for @itemLavender.
  ///
  /// In en, this message translates to:
  /// **'Lavender'**
  String get itemLavender;

  /// No description provided for @itemTurquoise.
  ///
  /// In en, this message translates to:
  /// **'Turquoise'**
  String get itemTurquoise;

  /// No description provided for @itemBicycle.
  ///
  /// In en, this message translates to:
  /// **'Bicycle'**
  String get itemBicycle;

  /// No description provided for @itemScooter.
  ///
  /// In en, this message translates to:
  /// **'Scooter'**
  String get itemScooter;

  /// No description provided for @itemElectricCar.
  ///
  /// In en, this message translates to:
  /// **'Electric Car'**
  String get itemElectricCar;

  /// No description provided for @itemVintageCar.
  ///
  /// In en, this message translates to:
  /// **'Vintage Car'**
  String get itemVintageCar;

  /// No description provided for @itemMotorcycle.
  ///
  /// In en, this message translates to:
  /// **'Motorcycle'**
  String get itemMotorcycle;

  /// No description provided for @itemSkateboard.
  ///
  /// In en, this message translates to:
  /// **'Skateboard'**
  String get itemSkateboard;

  /// No description provided for @itemUnicycle.
  ///
  /// In en, this message translates to:
  /// **'Unicycle'**
  String get itemUnicycle;

  /// No description provided for @itemSegway.
  ///
  /// In en, this message translates to:
  /// **'Segway'**
  String get itemSegway;

  /// No description provided for @itemRollerblades.
  ///
  /// In en, this message translates to:
  /// **'Rollerblades'**
  String get itemRollerblades;

  /// No description provided for @itemMoped.
  ///
  /// In en, this message translates to:
  /// **'Moped'**
  String get itemMoped;

  /// No description provided for @itemPiano.
  ///
  /// In en, this message translates to:
  /// **'Piano'**
  String get itemPiano;

  /// No description provided for @itemGuitar.
  ///
  /// In en, this message translates to:
  /// **'Guitar'**
  String get itemGuitar;

  /// No description provided for @itemViolin.
  ///
  /// In en, this message translates to:
  /// **'Violin'**
  String get itemViolin;

  /// No description provided for @itemDrums.
  ///
  /// In en, this message translates to:
  /// **'Drums'**
  String get itemDrums;

  /// No description provided for @itemFlute.
  ///
  /// In en, this message translates to:
  /// **'Flute'**
  String get itemFlute;

  /// No description provided for @itemSaxophone.
  ///
  /// In en, this message translates to:
  /// **'Saxophone'**
  String get itemSaxophone;

  /// No description provided for @itemCello.
  ///
  /// In en, this message translates to:
  /// **'Cello'**
  String get itemCello;

  /// No description provided for @itemTrumpet.
  ///
  /// In en, this message translates to:
  /// **'Trumpet'**
  String get itemTrumpet;

  /// No description provided for @itemHarp.
  ///
  /// In en, this message translates to:
  /// **'Harp'**
  String get itemHarp;

  /// No description provided for @itemClarinet.
  ///
  /// In en, this message translates to:
  /// **'Clarinet'**
  String get itemClarinet;

  /// No description provided for @itemAmerican.
  ///
  /// In en, this message translates to:
  /// **'American'**
  String get itemAmerican;

  /// No description provided for @itemBrazilian.
  ///
  /// In en, this message translates to:
  /// **'Brazilian'**
  String get itemBrazilian;

  /// No description provided for @itemChinese.
  ///
  /// In en, this message translates to:
  /// **'Chinese'**
  String get itemChinese;

  /// No description provided for @itemJapanese.
  ///
  /// In en, this message translates to:
  /// **'Japanese'**
  String get itemJapanese;

  /// No description provided for @itemEgyptian.
  ///
  /// In en, this message translates to:
  /// **'Egyptian'**
  String get itemEgyptian;

  /// No description provided for @itemSpanish.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get itemSpanish;

  /// No description provided for @itemRussian.
  ///
  /// In en, this message translates to:
  /// **'Russian'**
  String get itemRussian;

  /// No description provided for @itemIndian.
  ///
  /// In en, this message translates to:
  /// **'Indian'**
  String get itemIndian;

  /// No description provided for @itemMoroccan.
  ///
  /// In en, this message translates to:
  /// **'Moroccan'**
  String get itemMoroccan;

  /// No description provided for @itemItalian.
  ///
  /// In en, this message translates to:
  /// **'Italian'**
  String get itemItalian;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
