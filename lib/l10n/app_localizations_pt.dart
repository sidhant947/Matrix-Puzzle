// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Matrix Puzzle';

  @override
  String get appSubtitle => 'Quebra-Cabeça de Lógica num Arranha-Céu';

  @override
  String get play => 'Jogar';

  @override
  String get dailyChallenge => 'Desafio Diário';

  @override
  String get levels => 'Níveis';

  @override
  String get randomPuzzle => 'Quebra-Cabeça Aleatório';

  @override
  String get howToPlay => 'Como Jogar';

  @override
  String get settings => 'Configurações';

  @override
  String get selectDifficulty => 'Selecionar Dificuldade';

  @override
  String get difficultyEasy => 'Fácil';

  @override
  String get difficultyMedium => 'Médio';

  @override
  String get difficultyHard => 'Difícil';

  @override
  String get difficultyExpert => 'Especialista';

  @override
  String floorsCount(int count) {
    return '$count Andares';
  }

  @override
  String levelTitle(int levelNumber) {
    return 'Nível $levelNumber';
  }

  @override
  String get practiceBuilding => 'Prédio de Prática';

  @override
  String get floor => 'Andar';

  @override
  String get floorGround => 'T';

  @override
  String get floorTop => 'C';

  @override
  String get categoryName => 'Nome';

  @override
  String get categoryProfession => 'Profissão';

  @override
  String get categoryPet => 'Pet';

  @override
  String get categoryHobby => 'Hobby';

  @override
  String get categoryDrink => 'Bebida';

  @override
  String get categoryColor => 'Cor';

  @override
  String get categoryVehicle => 'Veículo';

  @override
  String get categoryInstrument => 'Instrumento';

  @override
  String get categoryNationality => 'Nacionalidade';

  @override
  String get notes => 'NOTAS';

  @override
  String get notesHint => 'Escreva suas notas ou deduções aqui...';

  @override
  String get clues => 'PISTAS';

  @override
  String get resetGame => 'Reiniciar Jogo';

  @override
  String get resetGameConfirmation =>
      'Tem certeza de que deseja reiniciar o jogo atual?';

  @override
  String get leaveGame => 'Leave Game';

  @override
  String get leaveGameConfirmation =>
      'Are you sure you want to leave the game?';

  @override
  String get leave => 'Leave';

  @override
  String get cancel => 'Cancelar';

  @override
  String get reset => 'Reiniciar';

  @override
  String get hint => 'Dica';

  @override
  String get tapACell => 'Toque em uma célula';

  @override
  String get undo => 'Desfazer';

  @override
  String get victoryMessage =>
      'Parabéns! Você resolveu o quebra-cabeça corretamente!';

  @override
  String get nextLevel => 'Próximo Nível';

  @override
  String get mainMenu => 'Menu Principal';

  @override
  String get buyMeACoffee => 'Pague-me um café';

  @override
  String get checkSolution => 'Verificar Solução';

  @override
  String get incorrectSolution => 'Solução Incorreta';

  @override
  String get incorrectSolutionMessage =>
      'A solução está incorreta. Continue tentando!';

  @override
  String get ok => 'OK';

  @override
  String get dailyCompletedMessage =>
      'Você resolveu o desafio de hoje! Volte amanhã para um novo.';

  @override
  String get dailyInstructionMessage =>
      'Resolva o enigma de hoje. A mesma grade e pistas para todos os jogadores hoje.';

  @override
  String get replayChallenge => 'Jogar Desafio Novamente';

  @override
  String get playTodayRiddle => 'Jogar o Enigma de Hoje';

  @override
  String get objectiveTitle => 'Objetivo';

  @override
  String get objectiveDescription =>
      'Matrix Puzzle é um quebra-cabeça de lógica dedutiva onde você determina qual residente mora em cada andar de um prédio. Cada quebra-cabeça apresenta temas dinâmicos com diferentes categorias (como Nomes, Pets, Hobbies, Bebidas, Profissões, Veículos, Cores, Instrumentos e Nacionalidades). Cada andar tem exatamente um residente com um item de cada categoria. Seu objetivo é deduzir a solução completa usando as pistas.';

  @override
  String get clueTypesTitle => 'Tipos de Pistas e Significados';

  @override
  String get clueSectionDirectTitle => '1. Pistas Diretas e de Paridade';

  @override
  String get clueSectionDirectDesc =>
      'Estas identificam posições exatas de andares ou propriedades numéricas.';

  @override
  String get exampleDirectClue1 => 'James mora no 1º andar (Térreo).';

  @override
  String get exampleDirectMeaning1 =>
      'James está no Andar 1. Toque na célula Nome no Andar 1 e selecione \'James\'.';

  @override
  String get exampleDirectClue2 => 'O(a) Médico(a) mora em um andar ímpar.';

  @override
  String get exampleDirectMeaning2 =>
      'O(a) Médico(a) só pode morar no Andar 1, 3, 5, 7, etc.';

  @override
  String get clueSectionAssociationTitle =>
      '2. Pistas de Associação e Negativas';

  @override
  String get clueSectionAssociationDesc =>
      'Estas unem ou separam duas características pertencentes aos moradores.';

  @override
  String get exampleAssocClue1 => 'Maria tem um Gato.';

  @override
  String get exampleAssocMeaning1 => 'Maria e Gato pertencem ao mesmo andar.';

  @override
  String get exampleAssocClue2 => 'Chen não bebe Café.';

  @override
  String get exampleAssocMeaning2 =>
      'Chen e Café não podem estar no mesmo andar.';

  @override
  String get clueSectionNeighborTitle => '3. Vizinhos e Posição Relativa';

  @override
  String get clueSectionNeighborDesc =>
      'Estas descrevem relações de posicionamento vertical entre os moradores.';

  @override
  String get exampleNeighborClue1 => 'Yuki mora exatamente acima de Ahmed.';

  @override
  String get exampleNeighborMeaning1 =>
      'Yuki está no andar imediatamente acima de Ahmed (Andar X + 1).';

  @override
  String get exampleNeighborClue2 => 'Sofia mora em um andar vizinho a Dmitri.';

  @override
  String get exampleNeighborMeaning2 =>
      'Sofia mora exatamente acima ou exatamente abaixo de Dmitri (|Andar A - Andar B| = 1).';

  @override
  String get exampleNeighborClue3 =>
      'O(a) Piloto mora em algum andar acima do(a) Chef.';

  @override
  String get exampleNeighborMeaning3 =>
      'O(a) Piloto mora em qualquer andar mais alto que o(a) Chef (Andar > X).';

  @override
  String get clueSectionDistanceTitle => '4. Pistas de Distância e Intervalo';

  @override
  String get clueSectionDistanceDesc =>
      'Pistas avançadas que especificam distâncias relativas e arranjos intercalados.';

  @override
  String get exampleDistanceClue1 =>
      'Elena mora exatamente 2 andares acima de Priya.';

  @override
  String get exampleDistanceMeaning1 =>
      'O andar de Elena é exatamente o andar de Priya + 2 (ex: Andares 1 e 3, ou Andares 3 e 5).';

  @override
  String get exampleDistanceClue2 =>
      'Chen mora em um andar entre Maria e o(a) Arquiteto(a).';

  @override
  String get exampleDistanceMeaning2 =>
      'O andar de Chen fica estritamente entre o andar de Maria e o andar do(a) Arquiteto(a).';

  @override
  String get toolsAndControlsTitle => 'Ferramentas e Controles';

  @override
  String get helpfulFeaturesTitle => 'Recursos Úteis';

  @override
  String get helpfulFeaturesDesc =>
      'Use estas ferramentas no jogo para auxiliar em suas deduções:';

  @override
  String get toolHintTitle => 'Botão de Dica (Acima da Grade)';

  @override
  String get toolHintDesc =>
      'Toque em Dica e, em seguida, toque em qualquer célula na grade para revelar o valor correto. Você recebe 1 dica para quebra-cabeças de 3-4 andares e 2 dicas para quebra-cabeças de 5+ andares.';

  @override
  String get toolUndoTitle => 'Botão Desfazer (Acima da Grade)';

  @override
  String get toolUndoDesc =>
      'Toque em Desfazer para reverter sua última colocação de célula ou ação de dica.';

  @override
  String get toolCrossOutTitle => 'Riscar Pistas';

  @override
  String get toolCrossOutDesc =>
      'Toque em qualquer pista na lista de pistas para riscá-la assim que tiver aplicado sua dedução.';

  @override
  String get toolNotesTitle => 'Botão de Notas (Canto Inferior Direito)';

  @override
  String get toolNotesDesc =>
      'Toque no botão flutuante de notas para anotar seus próprios rascunhos de deduções.';

  @override
  String get customizeBuildingSize => 'Personalizar Tamanho do Prédio';

  @override
  String floorsSliderLabel(int count) {
    return 'Andares: $count';
  }

  @override
  String get generatePracticeBuilding => 'Gerar Prédio de Prática';

  @override
  String get language => 'Idioma';

  @override
  String get systemDefault => 'Padrão do Sistema';

  @override
  String get moveCrossedCluesToBottomTitle =>
      'Mover Pistas Riscadas para o Fim';

  @override
  String get moveCrossedCluesToBottomSubtitle =>
      'Quando ativado, as pistas riscadas serão movidas para o final da lista';

  @override
  String get autoCheckSolutionTitle => 'Verificação Automática';

  @override
  String get autoCheckSolutionSubtitle =>
      'Verifica e conclui automaticamente o quebra-cabeça quando correto, removendo o botão Verificar Solução';

  @override
  String get followOnTwitter => 'Siga-me no Twitter';

  @override
  String get followOnMastodon => 'Siga-me no Mastodon';

  @override
  String clueFixedFloorGround(String subject) {
    return '$subject mora no 1º andar (Térreo).';
  }

  @override
  String clueFixedFloorTop(String subject, String ordinal) {
    return '$subject mora no $ordinal andar (Cobertura).';
  }

  @override
  String clueFixedFloor(String subject, String ordinal) {
    return '$subject mora no $ordinal andar.';
  }

  @override
  String clueParityOdd(String subject) {
    return '$subject mora em um andar ímpar.';
  }

  @override
  String clueParityEven(String subject) {
    return '$subject mora em um andar par.';
  }

  @override
  String clueImmediateAbove(String subject1, String subject2) {
    return '$subject1 mora exatamente acima de $subject2.';
  }

  @override
  String clueSomewhereAbove(String subject1, String subject2) {
    return '$subject1 mora em algum andar acima de $subject2.';
  }

  @override
  String clueAdjacent(String subject1, String subject2) {
    return '$subject1 mora em um andar vizinho a $subject2.';
  }

  @override
  String clueDistanceAbove(String subject1, String subject2, int distance) {
    return '$subject1 mora exatamente $distance andares acima de $subject2.';
  }

  @override
  String clueBetween(String subject1, String subject2, String subject3) {
    return '$subject1 mora em um andar entre $subject2 e $subject3.';
  }

  @override
  String clueSameFloorPet(String name, String article, String value) {
    return '$name tem $article $value.';
  }

  @override
  String clueSameFloorHobby(String name, String value) {
    return '$name gosta de $value.';
  }

  @override
  String clueSameFloorDrink(String name, String value) {
    return '$name bebe $value.';
  }

  @override
  String clueSameFloorVehicle(String name, String article, String value) {
    return '$name dirige $article $value.';
  }

  @override
  String clueSameFloorInstrument(String name, String value) {
    return '$name toca $value.';
  }

  @override
  String clueSameFloorColor(String name, String article, String value) {
    return '$name tem a porta $value.';
  }

  @override
  String clueSameFloorProfession(String name, String article, String value) {
    return '$name é $article $value.';
  }

  @override
  String clueSameFloorNationality(String name, String value) {
    return '$name é $value.';
  }

  @override
  String clueSameFloorGeneric(String subject1, String subject2) {
    return '$subject1 divide o andar com $subject2.';
  }

  @override
  String clueNegativeFloorPet(String name, String article, String value) {
    return '$name não tem $article $value.';
  }

  @override
  String clueNegativeFloorHobby(String name, String value) {
    return '$name não gosta de $value.';
  }

  @override
  String clueNegativeFloorDrink(String name, String value) {
    return '$name não bebe $value.';
  }

  @override
  String clueNegativeFloorVehicle(String name, String article, String value) {
    return '$name não dirige $article $value.';
  }

  @override
  String clueNegativeFloorInstrument(String name, String value) {
    return '$name não toca $value.';
  }

  @override
  String clueNegativeFloorColor(String name, String article, String value) {
    return '$name não tem a porta $value.';
  }

  @override
  String clueNegativeFloorProfession(
    String name,
    String article,
    String value,
  ) {
    return '$name não é $article $value.';
  }

  @override
  String clueNegativeFloorNationality(String name, String value) {
    return '$name não é $value.';
  }

  @override
  String clueNegativeFloorGeneric(String subject1, String subject2) {
    return '$subject1 não mora no mesmo andar que $subject2.';
  }

  @override
  String clueSubjectNationalityCap(String value) {
    return 'O(a) morador(a) $value';
  }

  @override
  String clueSubjectNationalityLow(String value) {
    return 'o(a) morador(a) $value';
  }

  @override
  String clueSubjectPetCap(String article, String value) {
    return 'A pessoa com $article $value';
  }

  @override
  String clueSubjectPetLow(String article, String value) {
    return 'a pessoa com $article $value';
  }

  @override
  String clueSubjectHobbyCap(String value) {
    return 'A pessoa que gosta de $value';
  }

  @override
  String clueSubjectHobbyLow(String value) {
    return 'a pessoa que gosta de $value';
  }

  @override
  String clueSubjectDrinkCap(String value) {
    return 'Quem bebe $value';
  }

  @override
  String clueSubjectDrinkLow(String value) {
    return 'quem bebe $value';
  }

  @override
  String clueSubjectVehicleCap(String article, String value) {
    return 'A pessoa com $article $value';
  }

  @override
  String clueSubjectVehicleLow(String article, String value) {
    return 'a pessoa com $article $value';
  }

  @override
  String clueSubjectInstrumentCap(String value) {
    return 'Quem toca $value';
  }

  @override
  String clueSubjectInstrumentLow(String value) {
    return 'quem toca $value';
  }

  @override
  String clueSubjectColorCap(String value) {
    return 'O morador com a porta $value';
  }

  @override
  String clueSubjectColorLow(String value) {
    return 'o morador com a porta $value';
  }

  @override
  String clueSubjectGenericCap(String value) {
    return 'O(a) $value';
  }

  @override
  String clueSubjectGenericLow(String value) {
    return 'o(a) $value';
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
  String get itemDmitri => 'Dimitri';

  @override
  String get itemYuki => 'Yuki';

  @override
  String get itemOmar => 'Omar';

  @override
  String get itemFatima => 'Fátima';

  @override
  String get itemAisha => 'Aisha';

  @override
  String get itemMei => 'Mei';

  @override
  String get itemChloe => 'Cloé';

  @override
  String get itemZara => 'Zara';

  @override
  String get itemLucia => 'Lúcia';

  @override
  String get itemAmara => 'Amara';

  @override
  String get itemIngrid => 'Ingride';

  @override
  String get itemAnanya => 'Ananya';

  @override
  String get itemLeila => 'Leila';

  @override
  String get itemDoctor => 'Médico(a)';

  @override
  String get itemEngineer => 'Engenheiro(a)';

  @override
  String get itemTeacher => 'Professor(a)';

  @override
  String get itemArtist => 'Artista';

  @override
  String get itemLawyer => 'Advogado(a)';

  @override
  String get itemPilot => 'Piloto';

  @override
  String get itemChef => 'Chef';

  @override
  String get itemNurse => 'Enfermeiro(a)';

  @override
  String get itemArchitect => 'Arquiteto(a)';

  @override
  String get itemMusician => 'Músico(a)';

  @override
  String get itemCat => 'Gato';

  @override
  String get itemDog => 'Cachorro';

  @override
  String get itemParrot => 'Papagaio';

  @override
  String get itemHamster => 'Hamster';

  @override
  String get itemTurtle => 'Tartaruga';

  @override
  String get itemRabbit => 'Coelho';

  @override
  String get itemIguana => 'Iguana';

  @override
  String get itemFerret => 'Furão';

  @override
  String get itemFish => 'Peixe';

  @override
  String get itemHedgehog => 'Ouriço';

  @override
  String get itemGardening => 'Jardinagem';

  @override
  String get itemPhotography => 'Fotografia';

  @override
  String get itemChess => 'Xadrez';

  @override
  String get itemPainting => 'Pintura';

  @override
  String get itemBaking => 'Confeitaria';

  @override
  String get itemAstronomy => 'Astronomia';

  @override
  String get itemGaming => 'Jogos';

  @override
  String get itemHiking => 'Trilha';

  @override
  String get itemYoga => 'Yoga';

  @override
  String get itemOrigami => 'Origami';

  @override
  String get itemEspresso => 'Espresso';

  @override
  String get itemGreenTea => 'Chá Verde';

  @override
  String get itemCocoa => 'Cacau';

  @override
  String get itemLemonade => 'Limonada';

  @override
  String get itemBoba => 'Chá de bolhas';

  @override
  String get itemCappuccino => 'Cappuccino';

  @override
  String get itemSmoothie => 'Smoothie';

  @override
  String get itemChai => 'Chai';

  @override
  String get itemMilkshake => 'Milkshake';

  @override
  String get itemIcedCoffee => 'Café Gelado';

  @override
  String get itemCrimson => 'Carmesim';

  @override
  String get itemSapphire => 'Safira';

  @override
  String get itemEmerald => 'Esmeralda';

  @override
  String get itemAmber => 'Âmbar';

  @override
  String get itemViolet => 'Violeta';

  @override
  String get itemCoral => 'Coral';

  @override
  String get itemTeal => 'Verde-azulado';

  @override
  String get itemGold => 'Dourada';

  @override
  String get itemLavender => 'Lavanda';

  @override
  String get itemTurquoise => 'Turquesa';

  @override
  String get itemBicycle => 'Bicicleta';

  @override
  String get itemScooter => 'Patinete';

  @override
  String get itemElectricCar => 'Carro Elétrico';

  @override
  String get itemVintageCar => 'Carro Clássico';

  @override
  String get itemMotorcycle => 'Moto';

  @override
  String get itemSkateboard => 'Skate';

  @override
  String get itemUnicycle => 'Monociclo';

  @override
  String get itemSegway => 'Segway';

  @override
  String get itemRollerblades => 'Patins';

  @override
  String get itemMoped => 'Motoneta';

  @override
  String get itemPiano => 'Piano';

  @override
  String get itemGuitar => 'Violão';

  @override
  String get itemViolin => 'Violino';

  @override
  String get itemDrums => 'Bateria';

  @override
  String get itemFlute => 'Flauta';

  @override
  String get itemSaxophone => 'Saxofone';

  @override
  String get itemCello => 'Violoncelo';

  @override
  String get itemTrumpet => 'Trompete';

  @override
  String get itemHarp => 'Harpa';

  @override
  String get itemClarinet => 'Clarinete';

  @override
  String get itemAmerican => 'Estadunidense';

  @override
  String get itemBrazilian => 'Brasileiro(a)';

  @override
  String get itemChinese => 'Chinês(a)';

  @override
  String get itemJapanese => 'Japonês(a)';

  @override
  String get itemEgyptian => 'Egípcio(a)';

  @override
  String get itemSpanish => 'Espanhol(a)';

  @override
  String get itemRussian => 'Russo(a)';

  @override
  String get itemIndian => 'Indiano(a)';

  @override
  String get itemMoroccan => 'Marroquino(a)';

  @override
  String get itemItalian => 'Italiano(a)';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

  @override
  String get appTitle => 'Matrix Puzzle';

  @override
  String get appSubtitle => 'Quebra-Cabeça de Lógica num Arranha-Céu';

  @override
  String get play => 'Jogar';

  @override
  String get dailyChallenge => 'Desafio Diário';

  @override
  String get levels => 'Níveis';

  @override
  String get randomPuzzle => 'Quebra-Cabeça Aleatório';

  @override
  String get howToPlay => 'Como Jogar';

  @override
  String get settings => 'Configurações';

  @override
  String get selectDifficulty => 'Selecionar Dificuldade';

  @override
  String get difficultyEasy => 'Fácil';

  @override
  String get difficultyMedium => 'Médio';

  @override
  String get difficultyHard => 'Difícil';

  @override
  String get difficultyExpert => 'Especialista';

  @override
  String floorsCount(int count) {
    return '$count Andares';
  }

  @override
  String levelTitle(int levelNumber) {
    return 'Nível $levelNumber';
  }

  @override
  String get practiceBuilding => 'Prédio de Prática';

  @override
  String get floor => 'Andar';

  @override
  String get floorGround => 'T';

  @override
  String get floorTop => 'C';

  @override
  String get categoryName => 'Nome';

  @override
  String get categoryProfession => 'Profissão';

  @override
  String get categoryPet => 'Pet';

  @override
  String get categoryHobby => 'Hobby';

  @override
  String get categoryDrink => 'Bebida';

  @override
  String get categoryColor => 'Cor';

  @override
  String get categoryVehicle => 'Veículo';

  @override
  String get categoryInstrument => 'Instrumento';

  @override
  String get categoryNationality => 'Nacionalidade';

  @override
  String get notes => 'NOTAS';

  @override
  String get notesHint => 'Escreva suas notas ou deduções aqui...';

  @override
  String get clues => 'PISTAS';

  @override
  String get resetGame => 'Reiniciar Jogo';

  @override
  String get resetGameConfirmation =>
      'Tem certeza de que deseja reiniciar o jogo atual?';

  @override
  String get cancel => 'Cancelar';

  @override
  String get reset => 'Reiniciar';

  @override
  String get hint => 'Dica';

  @override
  String get tapACell => 'Toque em uma célula';

  @override
  String get undo => 'Desfazer';

  @override
  String get victoryMessage =>
      'Parabéns! Você resolveu o quebra-cabeça corretamente!';

  @override
  String get nextLevel => 'Próximo Nível';

  @override
  String get mainMenu => 'Menu Principal';

  @override
  String get buyMeACoffee => 'Pague-me um café';

  @override
  String get checkSolution => 'Verificar Solução';

  @override
  String get incorrectSolution => 'Solução Incorreta';

  @override
  String get incorrectSolutionMessage =>
      'A solução está incorreta. Continue tentando!';

  @override
  String get ok => 'OK';

  @override
  String get dailyCompletedMessage =>
      'Você resolveu o desafio de hoje! Volte amanhã para um novo.';

  @override
  String get dailyInstructionMessage =>
      'Resolva o enigma de hoje. A mesma grade e pistas para todos os jogadores hoje.';

  @override
  String get replayChallenge => 'Jogar Desafio Novamente';

  @override
  String get playTodayRiddle => 'Jogar o Enigma de Hoje';

  @override
  String get objectiveTitle => 'Objetivo';

  @override
  String get objectiveDescription =>
      'Matrix Puzzle é um quebra-cabeça de lógica dedutiva onde você determina qual residente mora em cada andar de um prédio. Cada quebra-cabeça apresenta temas dinâmicos com diferentes categorias (como Nomes, Pets, Hobbies, Bebidas, Profissões, Veículos, Cores, Instrumentos e Nacionalidades). Cada andar tem exatamente um residente com um item de cada categoria. Seu objetivo é deduzir a solução completa usando as pistas.';

  @override
  String get clueTypesTitle => 'Tipos de Pistas e Significados';

  @override
  String get clueSectionDirectTitle => '1. Pistas Diretas e de Paridade';

  @override
  String get clueSectionDirectDesc =>
      'Estas identificam posições exatas de andares ou propriedades numéricas.';

  @override
  String get exampleDirectClue1 => 'James mora no 1º andar (Térreo).';

  @override
  String get exampleDirectMeaning1 =>
      'James está no Andar 1. Toque na célula Nome no Andar 1 e selecione \'James\'.';

  @override
  String get exampleDirectClue2 => 'O(a) Médico(a) mora em um andar ímpar.';

  @override
  String get exampleDirectMeaning2 =>
      'O(a) Médico(a) só pode morar no Andar 1, 3, 5, 7, etc.';

  @override
  String get clueSectionAssociationTitle =>
      '2. Pistas de Associação e Negativas';

  @override
  String get clueSectionAssociationDesc =>
      'Estas unem ou separam duas características pertencentes aos moradores.';

  @override
  String get exampleAssocClue1 => 'Maria tem um Gato.';

  @override
  String get exampleAssocMeaning1 => 'Maria e Gato pertencem ao mesmo andar.';

  @override
  String get exampleAssocClue2 => 'Chen não bebe Café.';

  @override
  String get exampleAssocMeaning2 =>
      'Chen e Café não podem estar no mesmo andar.';

  @override
  String get clueSectionNeighborTitle => '3. Vizinhos e Posição Relativa';

  @override
  String get clueSectionNeighborDesc =>
      'Estas descrevem relações de posicionamento vertical entre os moradores.';

  @override
  String get exampleNeighborClue1 => 'Yuki mora exatamente acima de Ahmed.';

  @override
  String get exampleNeighborMeaning1 =>
      'Yuki está no andar imediatamente acima de Ahmed (Andar X + 1).';

  @override
  String get exampleNeighborClue2 =>
      'Sofia mora em um andar adjacente a Dmitri.';

  @override
  String get exampleNeighborMeaning2 =>
      'Sofia mora exatamente acima ou exatamente abaixo de Dmitri (|Andar A - Andar B| = 1).';

  @override
  String get exampleNeighborClue3 =>
      'O(a) Piloto mora em algum andar acima do(a) Chef.';

  @override
  String get exampleNeighborMeaning3 =>
      'O(a) Piloto mora em qualquer andar mais alto que o(a) Chef (Andar > X).';

  @override
  String get clueSectionDistanceTitle => '4. Pistas de Distância e Intervalo';

  @override
  String get clueSectionDistanceDesc =>
      'Pistas avançadas que especificam distâncias relativas e arranjos intercalados.';

  @override
  String get exampleDistanceClue1 =>
      'Elena mora exatamente 2 andares acima de Priya.';

  @override
  String get exampleDistanceMeaning1 =>
      'O andar de Elena é exatamente o andar de Priya + 2 (ex: Andares 1 e 3, ou Andares 3 e 5).';

  @override
  String get exampleDistanceClue2 =>
      'Chen mora em um andar entre Maria e o(a) Arquiteto(a).';

  @override
  String get exampleDistanceMeaning2 =>
      'O andar de Chen fica estritamente entre o andar de Maria e o andar do(a) Arquiteto(a).';

  @override
  String get toolsAndControlsTitle => 'Ferramentas e Controles';

  @override
  String get helpfulFeaturesTitle => 'Recursos Úteis';

  @override
  String get helpfulFeaturesDesc =>
      'Use estas ferramentas no jogo para auxiliar em suas deduções:';

  @override
  String get toolHintTitle => 'Botão de Dica (Acima da Grade)';

  @override
  String get toolHintDesc =>
      'Toque em Dica e, em seguida, toque em qualquer célula na grade para revelar o valor correto. Você recebe 1 dica para quebra-cabeças de 3-4 andares e 2 dicas para quebra-cabeças de 5+ andares.';

  @override
  String get toolUndoTitle => 'Botão Desfazer (Acima da Grade)';

  @override
  String get toolUndoDesc =>
      'Toque em Desfazer para reverter sua última colocação de célula ou ação de dica.';

  @override
  String get toolCrossOutTitle => 'Riscar Pistas';

  @override
  String get toolCrossOutDesc =>
      'Toque em qualquer pista na lista de pistas para riscá-la assim que tiver aplicado sua dedução.';

  @override
  String get toolNotesTitle => 'Botão de Notas (Canto Inferior Direito)';

  @override
  String get toolNotesDesc =>
      'Toque no botão flutuante de notas para anotar seus próprios rascunhos de deduções.';

  @override
  String get customizeBuildingSize => 'Personalizar Tamanho do Prédio';

  @override
  String floorsSliderLabel(int count) {
    return 'Andares: $count';
  }

  @override
  String get generatePracticeBuilding => 'Gerar Prédio de Prática';

  @override
  String get language => 'Idioma';

  @override
  String get systemDefault => 'Padrão do Sistema';

  @override
  String get moveCrossedCluesToBottomTitle =>
      'Mover Pistas Riscadas para o Fim';

  @override
  String get moveCrossedCluesToBottomSubtitle =>
      'Quando ativado, as pistas riscadas serão movidas para o final da lista';

  @override
  String get autoCheckSolutionTitle => 'Verificação Automática';

  @override
  String get autoCheckSolutionSubtitle =>
      'Verifica e conclui automaticamente o quebra-cabeça quando correto, removendo o botão Verificar Solução';

  @override
  String get followOnTwitter => 'Siga-me no Twitter';

  @override
  String get followOnMastodon => 'Siga-me no Mastodon';

  @override
  String clueFixedFloorGround(String subject) {
    return '$subject mora no 1º andar (Térreo).';
  }

  @override
  String clueFixedFloorTop(String subject, String ordinal) {
    return '$subject mora no $ordinal andar (Cobertura).';
  }

  @override
  String clueFixedFloor(String subject, String ordinal) {
    return '$subject mora no $ordinal andar.';
  }

  @override
  String clueParityOdd(String subject) {
    return '$subject mora em um andar ímpar.';
  }

  @override
  String clueParityEven(String subject) {
    return '$subject mora em um andar par.';
  }

  @override
  String clueImmediateAbove(String subject1, String subject2) {
    return '$subject1 mora exatamente acima de $subject2.';
  }

  @override
  String clueSomewhereAbove(String subject1, String subject2) {
    return '$subject1 mora em algum andar acima de $subject2.';
  }

  @override
  String clueAdjacent(String subject1, String subject2) {
    return '$subject1 mora em um andar adjacente a $subject2.';
  }

  @override
  String clueDistanceAbove(String subject1, String subject2, int distance) {
    return '$subject1 mora exatamente $distance andares acima de $subject2.';
  }

  @override
  String clueBetween(String subject1, String subject2, String subject3) {
    return '$subject1 mora em um andar entre $subject2 e $subject3.';
  }

  @override
  String clueSameFloorPet(String name, String article, String value) {
    return '$name tem $article $value.';
  }

  @override
  String clueSameFloorHobby(String name, String value) {
    return '$name gosta de $value.';
  }

  @override
  String clueSameFloorDrink(String name, String value) {
    return '$name bebe $value.';
  }

  @override
  String clueSameFloorVehicle(String name, String article, String value) {
    return '$name dirige $article $value.';
  }

  @override
  String clueSameFloorInstrument(String name, String value) {
    return '$name toca $value.';
  }

  @override
  String clueSameFloorColor(String name, String article, String value) {
    return '$name tem a porta $value.';
  }

  @override
  String clueSameFloorProfession(String name, String article, String value) {
    return '$name é $article $value.';
  }

  @override
  String clueSameFloorNationality(String name, String value) {
    return '$name é $value.';
  }

  @override
  String clueSameFloorGeneric(String subject1, String subject2) {
    return '$subject1 divide o andar com $subject2.';
  }

  @override
  String clueNegativeFloorPet(String name, String article, String value) {
    return '$name não tem $article $value.';
  }

  @override
  String clueNegativeFloorHobby(String name, String value) {
    return '$name não gosta de $value.';
  }

  @override
  String clueNegativeFloorDrink(String name, String value) {
    return '$name não bebe $value.';
  }

  @override
  String clueNegativeFloorVehicle(String name, String article, String value) {
    return '$name não dirige $article $value.';
  }

  @override
  String clueNegativeFloorInstrument(String name, String value) {
    return '$name não toca $value.';
  }

  @override
  String clueNegativeFloorColor(String name, String article, String value) {
    return '$name não tem a porta $value.';
  }

  @override
  String clueNegativeFloorProfession(
    String name,
    String article,
    String value,
  ) {
    return '$name não é $article $value.';
  }

  @override
  String clueNegativeFloorNationality(String name, String value) {
    return '$name não é $value.';
  }

  @override
  String clueNegativeFloorGeneric(String subject1, String subject2) {
    return '$subject1 não mora no mesmo andar que $subject2.';
  }

  @override
  String clueSubjectNationalityCap(String value) {
    return 'O(a) morador(a) $value';
  }

  @override
  String clueSubjectNationalityLow(String value) {
    return 'o(a) morador(a) $value';
  }

  @override
  String clueSubjectPetCap(String article, String value) {
    return 'A pessoa com $article $value';
  }

  @override
  String clueSubjectPetLow(String article, String value) {
    return 'a pessoa com $article $value';
  }

  @override
  String clueSubjectHobbyCap(String value) {
    return 'A pessoa que gosta de $value';
  }

  @override
  String clueSubjectHobbyLow(String value) {
    return 'a pessoa que gosta de $value';
  }

  @override
  String clueSubjectDrinkCap(String value) {
    return 'Quem bebe $value';
  }

  @override
  String clueSubjectDrinkLow(String value) {
    return 'quem bebe $value';
  }

  @override
  String clueSubjectVehicleCap(String article, String value) {
    return 'A pessoa com $article $value';
  }

  @override
  String clueSubjectVehicleLow(String article, String value) {
    return 'a pessoa com $article $value';
  }

  @override
  String clueSubjectInstrumentCap(String value) {
    return 'Quem toca $value';
  }

  @override
  String clueSubjectInstrumentLow(String value) {
    return 'quem toca $value';
  }

  @override
  String clueSubjectColorCap(String value) {
    return 'O morador com a porta $value';
  }

  @override
  String clueSubjectColorLow(String value) {
    return 'o morador com a porta $value';
  }

  @override
  String clueSubjectGenericCap(String value) {
    return 'O(a) $value';
  }

  @override
  String clueSubjectGenericLow(String value) {
    return 'o(a) $value';
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
  String get itemDmitri => 'Dimitri';

  @override
  String get itemYuki => 'Yuki';

  @override
  String get itemOmar => 'Omar';

  @override
  String get itemFatima => 'Fátima';

  @override
  String get itemAisha => 'Aisha';

  @override
  String get itemMei => 'Mei';

  @override
  String get itemChloe => 'Cloé';

  @override
  String get itemZara => 'Zara';

  @override
  String get itemLucia => 'Lúcia';

  @override
  String get itemAmara => 'Amara';

  @override
  String get itemIngrid => 'Ingride';

  @override
  String get itemAnanya => 'Ananya';

  @override
  String get itemLeila => 'Leila';

  @override
  String get itemDoctor => 'Médico(a)';

  @override
  String get itemEngineer => 'Engenheiro(a)';

  @override
  String get itemTeacher => 'Professor(a)';

  @override
  String get itemArtist => 'Artista';

  @override
  String get itemLawyer => 'Advogado(a)';

  @override
  String get itemPilot => 'Piloto';

  @override
  String get itemChef => 'Chef';

  @override
  String get itemNurse => 'Enfermeiro(a)';

  @override
  String get itemArchitect => 'Arquiteto(a)';

  @override
  String get itemMusician => 'Músico(a)';

  @override
  String get itemCat => 'Gato';

  @override
  String get itemDog => 'Cachorro';

  @override
  String get itemParrot => 'Papagaio';

  @override
  String get itemHamster => 'Hamster';

  @override
  String get itemTurtle => 'Tartaruga';

  @override
  String get itemRabbit => 'Coelho';

  @override
  String get itemIguana => 'Iguana';

  @override
  String get itemFerret => 'Furão';

  @override
  String get itemFish => 'Peixe';

  @override
  String get itemHedgehog => 'Ouriço';

  @override
  String get itemGardening => 'Jardinagem';

  @override
  String get itemPhotography => 'Fotografia';

  @override
  String get itemChess => 'Xadrez';

  @override
  String get itemPainting => 'Pintura';

  @override
  String get itemBaking => 'Confeitaria';

  @override
  String get itemAstronomy => 'Astronomia';

  @override
  String get itemGaming => 'Jogos';

  @override
  String get itemHiking => 'Trilha';

  @override
  String get itemYoga => 'Yoga';

  @override
  String get itemOrigami => 'Origami';

  @override
  String get itemEspresso => 'Espresso';

  @override
  String get itemGreenTea => 'Chá Verde';

  @override
  String get itemCocoa => 'Cacau';

  @override
  String get itemLemonade => 'Limonada';

  @override
  String get itemBoba => 'Chá de bolhas';

  @override
  String get itemCappuccino => 'Cappuccino';

  @override
  String get itemSmoothie => 'Smoothie';

  @override
  String get itemChai => 'Chai';

  @override
  String get itemMilkshake => 'Milkshake';

  @override
  String get itemIcedCoffee => 'Café Gelado';

  @override
  String get itemCrimson => 'Carmesim';

  @override
  String get itemSapphire => 'Safira';

  @override
  String get itemEmerald => 'Esmeralda';

  @override
  String get itemAmber => 'Âmbar';

  @override
  String get itemViolet => 'Violeta';

  @override
  String get itemCoral => 'Coral';

  @override
  String get itemTeal => 'Verde-azulado';

  @override
  String get itemGold => 'Dourada';

  @override
  String get itemLavender => 'Lavanda';

  @override
  String get itemTurquoise => 'Turquesa';

  @override
  String get itemBicycle => 'Bicicleta';

  @override
  String get itemScooter => 'Patinete';

  @override
  String get itemElectricCar => 'Carro Elétrico';

  @override
  String get itemVintageCar => 'Carro Clássico';

  @override
  String get itemMotorcycle => 'Moto';

  @override
  String get itemSkateboard => 'Skate';

  @override
  String get itemUnicycle => 'Monociclo';

  @override
  String get itemSegway => 'Segway';

  @override
  String get itemRollerblades => 'Patins';

  @override
  String get itemMoped => 'Motoneta';

  @override
  String get itemPiano => 'Piano';

  @override
  String get itemGuitar => 'Violão';

  @override
  String get itemViolin => 'Violino';

  @override
  String get itemDrums => 'Bateria';

  @override
  String get itemFlute => 'Flauta';

  @override
  String get itemSaxophone => 'Saxofone';

  @override
  String get itemCello => 'Violoncelo';

  @override
  String get itemTrumpet => 'Trompete';

  @override
  String get itemHarp => 'Harpa';

  @override
  String get itemClarinet => 'Clarinete';

  @override
  String get itemAmerican => 'Estadunidense';

  @override
  String get itemBrazilian => 'Brasileiro(a)';

  @override
  String get itemChinese => 'Chinês(a)';

  @override
  String get itemJapanese => 'Japonês(a)';

  @override
  String get itemEgyptian => 'Egípcio(a)';

  @override
  String get itemSpanish => 'Espanhol(a)';

  @override
  String get itemRussian => 'Russo(a)';

  @override
  String get itemIndian => 'Indiano(a)';

  @override
  String get itemMoroccan => 'Marroquino(a)';

  @override
  String get itemItalian => 'Italiano(a)';
}
