// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BoardStore on _BoardStore, Store {
  final _$boardAtom = Atom(name: '_BoardStore.board');

  @override
  Map<int, BoardObject> get board {
    _$boardAtom.reportRead();
    return super.board;
  }

  @override
  set board(Map<int, BoardObject> value) {
    _$boardAtom.reportWrite(value, super.board, () {
      super.board = value;
    });
  }

  final _$isInBonusAtom = Atom(name: '_BoardStore.isInBonus');

  @override
  bool get isInBonus {
    _$isInBonusAtom.reportRead();
    return super.isInBonus;
  }

  @override
  set isInBonus(bool value) {
    _$isInBonusAtom.reportWrite(value, super.isInBonus, () {
      super.isInBonus = value;
    });
  }

  final _$bonusEpisodeNoAtom = Atom(name: '_BoardStore.bonusEpisodeNo');

  @override
  int get bonusEpisodeNo {
    _$bonusEpisodeNoAtom.reportRead();
    return super.bonusEpisodeNo;
  }

  @override
  set bonusEpisodeNo(int value) {
    _$bonusEpisodeNoAtom.reportWrite(value, super.bonusEpisodeNo, () {
      super.bonusEpisodeNo = value;
    });
  }

  final _$canActivateBonusAtom = Atom(name: '_BoardStore.canActivateBonus');

  @override
  bool get canActivateBonus {
    _$canActivateBonusAtom.reportRead();
    return super.canActivateBonus;
  }

  @override
  set canActivateBonus(bool value) {
    _$canActivateBonusAtom.reportWrite(value, super.canActivateBonus, () {
      super.canActivateBonus = value;
    });
  }

  final _$finishCodeAtom = Atom(name: '_BoardStore.finishCode');

  @override
  int get finishCode {
    _$finishCodeAtom.reportRead();
    return super.finishCode;
  }

  @override
  set finishCode(int value) {
    _$finishCodeAtom.reportWrite(value, super.finishCode, () {
      super.finishCode = value;
    });
  }

  final _$totalRewardEarnedAtom = Atom(name: '_BoardStore.totalRewardEarned');

  @override
  double get totalRewardEarned {
    _$totalRewardEarnedAtom.reportRead();
    return super.totalRewardEarned;
  }

  @override
  set totalRewardEarned(double value) {
    _$totalRewardEarnedAtom.reportWrite(value, super.totalRewardEarned, () {
      super.totalRewardEarned = value;
    });
  }

  final _$totalBoardsPredictedAtom =
      Atom(name: '_BoardStore.totalBoardsPredicted');

  @override
  int get totalBoardsPredicted {
    _$totalBoardsPredictedAtom.reportRead();
    return super.totalBoardsPredicted;
  }

  @override
  set totalBoardsPredicted(int value) {
    _$totalBoardsPredictedAtom.reportWrite(value, super.totalBoardsPredicted,
        () {
      super.totalBoardsPredicted = value;
    });
  }

  final _$showGridMemoryOrderAtom =
      Atom(name: '_BoardStore.showGridMemoryOrder');

  @override
  bool get showGridMemoryOrder {
    _$showGridMemoryOrderAtom.reportRead();
    return super.showGridMemoryOrder;
  }

  @override
  set showGridMemoryOrder(bool value) {
    _$showGridMemoryOrderAtom.reportWrite(value, super.showGridMemoryOrder, () {
      super.showGridMemoryOrder = value;
    });
  }

  final _$showStackMemoryOrderAtom =
      Atom(name: '_BoardStore.showStackMemoryOrder');

  @override
  bool get showStackMemoryOrder {
    _$showStackMemoryOrderAtom.reportRead();
    return super.showStackMemoryOrder;
  }

  @override
  set showStackMemoryOrder(bool value) {
    _$showStackMemoryOrderAtom.reportWrite(value, super.showStackMemoryOrder,
        () {
      super.showStackMemoryOrder = value;
    });
  }

  final _$bucketShapesAtom = Atom(name: '_BoardStore.bucketShapes');

  @override
  Map<int, String> get bucketShapes {
    _$bucketShapesAtom.reportRead();
    return super.bucketShapes;
  }

  @override
  set bucketShapes(Map<int, String> value) {
    _$bucketShapesAtom.reportWrite(value, super.bucketShapes, () {
      super.bucketShapes = value;
    });
  }

  final _$isPausedAtom = Atom(name: '_BoardStore.isPaused');

  @override
  bool get isPaused {
    _$isPausedAtom.reportRead();
    return super.isPaused;
  }

  @override
  set isPaused(bool value) {
    _$isPausedAtom.reportWrite(value, super.isPaused, () {
      super.isPaused = value;
    });
  }

  final _$seriesNoAtom = Atom(name: '_BoardStore.seriesNo');

  @override
  int get seriesNo {
    _$seriesNoAtom.reportRead();
    return super.seriesNo;
  }

  @override
  set seriesNo(int value) {
    _$seriesNoAtom.reportWrite(value, super.seriesNo, () {
      super.seriesNo = value;
    });
  }

  final _$transcriptAtom = Atom(name: '_BoardStore.transcript');

  @override
  List<TranscriptElement> get transcript {
    _$transcriptAtom.reportRead();
    return super.transcript;
  }

  @override
  set transcript(List<TranscriptElement> value) {
    _$transcriptAtom.reportWrite(value, super.transcript, () {
      super.transcript = value;
    });
  }

  final _$rulesSrcAtom = Atom(name: '_BoardStore.rulesSrc');

  @override
  RulesSrc get rulesSrc {
    _$rulesSrcAtom.reportRead();
    return super.rulesSrc;
  }

  @override
  set rulesSrc(RulesSrc value) {
    _$rulesSrcAtom.reportWrite(value, super.rulesSrc, () {
      super.rulesSrc = value;
    });
  }

  final _$ruleLineNoAtom = Atom(name: '_BoardStore.ruleLineNo');

  @override
  int get ruleLineNo {
    _$ruleLineNoAtom.reportRead();
    return super.ruleLineNo;
  }

  @override
  set ruleLineNo(int value) {
    _$ruleLineNoAtom.reportWrite(value, super.ruleLineNo, () {
      super.ruleLineNo = value;
    });
  }

  final _$numMovesMadeAtom = Atom(name: '_BoardStore.numMovesMade');

  @override
  int get numMovesMade {
    _$numMovesMadeAtom.reportRead();
    return super.numMovesMade;
  }

  @override
  set numMovesMade(int value) {
    _$numMovesMadeAtom.reportWrite(value, super.numMovesMade, () {
      super.numMovesMade = value;
    });
  }

  final _$episodeNoAtom = Atom(name: '_BoardStore.episodeNo');

  @override
  int get episodeNo {
    _$episodeNoAtom.reportRead();
    return super.episodeNo;
  }

  @override
  set episodeNo(int value) {
    _$episodeNoAtom.reportWrite(value, super.episodeNo, () {
      super.episodeNo = value;
    });
  }

  final _$stackMemoryDepthAtom = Atom(name: '_BoardStore.stackMemoryDepth');

  @override
  int get stackMemoryDepth {
    _$stackMemoryDepthAtom.reportRead();
    return super.stackMemoryDepth;
  }

  @override
  set stackMemoryDepth(int value) {
    _$stackMemoryDepthAtom.reportWrite(value, super.stackMemoryDepth, () {
      super.stackMemoryDepth = value;
    });
  }

  final _$movesLeftToStayInBonusAtom =
      Atom(name: '_BoardStore.movesLeftToStayInBonus');

  @override
  int get movesLeftToStayInBonus {
    _$movesLeftToStayInBonusAtom.reportRead();
    return super.movesLeftToStayInBonus;
  }

  @override
  set movesLeftToStayInBonus(int value) {
    _$movesLeftToStayInBonusAtom
        .reportWrite(value, super.movesLeftToStayInBonus, () {
      super.movesLeftToStayInBonus = value;
    });
  }

  final _$transitionMapAtom = Atom(name: '_BoardStore.transitionMap');

  @override
  TransitionMap get transitionMap {
    _$transitionMapAtom.reportRead();
    return super.transitionMap;
  }

  @override
  set transitionMap(TransitionMap value) {
    _$transitionMapAtom.reportWrite(value, super.transitionMap, () {
      super.transitionMap = value;
    });
  }

  final _$episodeIdAtom = Atom(name: '_BoardStore.episodeId');

  @override
  String get episodeId {
    _$episodeIdAtom.reportRead();
    return super.episodeId;
  }

  @override
  set episodeId(String value) {
    _$episodeIdAtom.reportWrite(value, super.episodeId, () {
      super.episodeId = value;
    });
  }

  final _$maxPointsAtom = Atom(name: '_BoardStore.maxPoints');

  @override
  double get maxPoints {
    _$maxPointsAtom.reportRead();
    return super.maxPoints;
  }

  @override
  set maxPoints(double value) {
    _$maxPointsAtom.reportWrite(value, super.maxPoints, () {
      super.maxPoints = value;
    });
  }

  final _$giveUpAtAtom = Atom(name: '_BoardStore.giveUpAt');

  @override
  int get giveUpAt {
    _$giveUpAtAtom.reportRead();
    return super.giveUpAt;
  }

  @override
  set giveUpAt(int value) {
    _$giveUpAtAtom.reportWrite(value, super.giveUpAt, () {
      super.giveUpAt = value;
    });
  }

  final _$feedbackSwitchesAtom = Atom(name: '_BoardStore.feedbackSwitches');

  @override
  String get feedbackSwitches {
    _$feedbackSwitchesAtom.reportRead();
    return super.feedbackSwitches;
  }

  @override
  set feedbackSwitches(String value) {
    _$feedbackSwitchesAtom.reportWrite(value, super.feedbackSwitches, () {
      super.feedbackSwitches = value;
    });
  }

  final _$pageAtom = Atom(name: '_BoardStore.page');

  @override
  Page get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(Page value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$playerIdAtom = Atom(name: '_BoardStore.playerId');

  @override
  String get playerId {
    _$playerIdAtom.reportRead();
    return super.playerId;
  }

  @override
  set playerId(String value) {
    _$playerIdAtom.reportWrite(value, super.playerId, () {
      super.playerId = value;
    });
  }

  final _$loadTrialsAsyncAction = AsyncAction('_BoardStore.loadTrials');

  @override
  Future<void> loadTrials() {
    return _$loadTrialsAsyncAction.run(() => super.loadTrials());
  }

  final _$newEpisodeAsyncAction = AsyncAction('_BoardStore.newEpisode');

  @override
  Future<void> newEpisode() {
    return _$newEpisodeAsyncAction.run(() => super.newEpisode());
  }

  final _$updateEpisodeAsyncAction = AsyncAction('_BoardStore.updateEpisode');

  @override
  Future<void> updateEpisode(Para para, String episodeId) {
    return _$updateEpisodeAsyncAction
        .run(() => super.updateEpisode(para, episodeId));
  }

  final _$updateBoardAsyncAction = AsyncAction('_BoardStore.updateBoard');

  @override
  Future<void> updateBoard() {
    return _$updateBoardAsyncAction.run(() => super.updateBoard());
  }

  final _$moveAsyncAction = AsyncAction('_BoardStore.move');

  @override
  Future<void> move(int boardObjectId, int bucket) {
    return _$moveAsyncAction.run(() => super.move(boardObjectId, bucket));
  }

  final _$giveUpAsyncAction = AsyncAction('_BoardStore.giveUp');

  @override
  Future<void> giveUp() {
    return _$giveUpAsyncAction.run(() => super.giveUp());
  }

  final _$guessAsyncAction = AsyncAction('_BoardStore.guess');

  @override
  Future<void> guess(String data, int confidence) {
    return _$guessAsyncAction.run(() => super.guess(data, confidence));
  }

  final _$skipGuessAsyncAction = AsyncAction('_BoardStore.skipGuess');

  @override
  Future<void> skipGuess() {
    return _$skipGuessAsyncAction.run(() => super.skipGuess());
  }

  final _$loadNextBonusAsyncAction = AsyncAction('_BoardStore.loadNextBonus');

  @override
  Future<void> loadNextBonus() {
    return _$loadNextBonusAsyncAction.run(() => super.loadNextBonus());
  }

  final _$pickAsyncAction = AsyncAction('_BoardStore.pick');

  @override
  Future<void> pick(int boardObjectId) {
    return _$pickAsyncAction.run(() => super.pick(boardObjectId));
  }

  final _$recordDemographicsAsyncAction =
      AsyncAction('_BoardStore.recordDemographics');

  @override
  Future<void> recordDemographics(String demographics) {
    return _$recordDemographicsAsyncAction
        .run(() => super.recordDemographics(demographics));
  }

  final _$activateBonusAsyncAction = AsyncAction('_BoardStore.activateBonus');

  @override
  Future<void> activateBonus(String playerId) {
    return _$activateBonusAsyncAction.run(() => super.activateBonus(playerId));
  }

  final _$_BoardStoreActionController = ActionController(name: '_BoardStore');

  @override
  void goToPage(Page page) {
    final _$actionInfo =
        _$_BoardStoreActionController.startAction(name: '_BoardStore.goToPage');
    try {
      return super.goToPage(page);
    } finally {
      _$_BoardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsInBonus(bool isInBonus) {
    final _$actionInfo = _$_BoardStoreActionController.startAction(
        name: '_BoardStore.setIsInBonus');
    try {
      return super.setIsInBonus(isInBonus);
    } finally {
      _$_BoardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
board: ${board},
isInBonus: ${isInBonus},
bonusEpisodeNo: ${bonusEpisodeNo},
canActivateBonus: ${canActivateBonus},
finishCode: ${finishCode},
totalRewardEarned: ${totalRewardEarned},
totalBoardsPredicted: ${totalBoardsPredicted},
showGridMemoryOrder: ${showGridMemoryOrder},
showStackMemoryOrder: ${showStackMemoryOrder},
bucketShapes: ${bucketShapes},
isPaused: ${isPaused},
seriesNo: ${seriesNo},
transcript: ${transcript},
rulesSrc: ${rulesSrc},
ruleLineNo: ${ruleLineNo},
numMovesMade: ${numMovesMade},
episodeNo: ${episodeNo},
stackMemoryDepth: ${stackMemoryDepth},
movesLeftToStayInBonus: ${movesLeftToStayInBonus},
transitionMap: ${transitionMap},
episodeId: ${episodeId},
maxPoints: ${maxPoints},
giveUpAt: ${giveUpAt},
feedbackSwitches: ${feedbackSwitches},
page: ${page},
playerId: ${playerId}
    ''';
  }
}
