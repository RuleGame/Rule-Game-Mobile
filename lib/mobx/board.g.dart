// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BoardStore on _BoardStore, Store {
  Computed<bool>? _$isGameCompletedComputed;

  @override
  bool get isGameCompleted =>
      (_$isGameCompletedComputed ??= Computed<bool>(() => super.isGameCompleted,
              name: '_BoardStore.isGameCompleted'))
          .value;
  Computed<bool>? _$displayBucketBinsComputed;

  @override
  bool get displayBucketBins => (_$displayBucketBinsComputed ??= Computed<bool>(
          () => super.displayBucketBins,
          name: '_BoardStore.displayBucketBins'))
      .value;
  Computed<bool>? _$hasMoreBonusRoundsComputed;

  @override
  bool get hasMoreBonusRounds => (_$hasMoreBonusRoundsComputed ??=
          Computed<bool>(() => super.hasMoreBonusRounds,
              name: '_BoardStore.hasMoreBonusRounds'))
      .value;
  Computed<int>? _$ruleNumComputed;

  @override
  int get ruleNum => (_$ruleNumComputed ??=
          Computed<int>(() => super.ruleNum, name: '_BoardStore.ruleNum'))
      .value;

  late final _$boardAtom = Atom(name: '_BoardStore.board', context: context);

  @override
  ObservableMap<int, BoardObject> get board {
    _$boardAtom.reportRead();
    return super.board;
  }

  @override
  set board(ObservableMap<int, BoardObject> value) {
    _$boardAtom.reportWrite(value, super.board, () {
      super.board = value;
    });
  }

  late final _$isInBonusAtom =
      Atom(name: '_BoardStore.isInBonus', context: context);

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

  late final _$bonusEpisodeNoAtom =
      Atom(name: '_BoardStore.bonusEpisodeNo', context: context);

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

  late final _$canActivateBonusAtom =
      Atom(name: '_BoardStore.canActivateBonus', context: context);

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

  late final _$finishCodeAtom =
      Atom(name: '_BoardStore.finishCode', context: context);

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

  late final _$totalRewardEarnedAtom =
      Atom(name: '_BoardStore.totalRewardEarned', context: context);

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

  late final _$totalBoardsPredictedAtom =
      Atom(name: '_BoardStore.totalBoardsPredicted', context: context);

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

  late final _$showGridMemoryOrderAtom =
      Atom(name: '_BoardStore.showGridMemoryOrder', context: context);

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

  late final _$showStackMemoryOrderAtom =
      Atom(name: '_BoardStore.showStackMemoryOrder', context: context);

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

  late final _$bucketShapesAtom =
      Atom(name: '_BoardStore.bucketShapes', context: context);

  @override
  ObservableMap<int, String> get bucketShapes {
    _$bucketShapesAtom.reportRead();
    return super.bucketShapes;
  }

  @override
  set bucketShapes(ObservableMap<int, String> value) {
    _$bucketShapesAtom.reportWrite(value, super.bucketShapes, () {
      super.bucketShapes = value;
    });
  }

  late final _$isPausedAtom =
      Atom(name: '_BoardStore.isPaused', context: context);

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

  late final _$seriesNoAtom =
      Atom(name: '_BoardStore.seriesNo', context: context);

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

  late final _$transcriptAtom =
      Atom(name: '_BoardStore.transcript', context: context);

  @override
  ObservableList<TranscriptElement> get transcript {
    _$transcriptAtom.reportRead();
    return super.transcript;
  }

  @override
  set transcript(ObservableList<TranscriptElement> value) {
    _$transcriptAtom.reportWrite(value, super.transcript, () {
      super.transcript = value;
    });
  }

  late final _$rulesSrcAtom =
      Atom(name: '_BoardStore.rulesSrc', context: context);

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

  late final _$ruleLineNoAtom =
      Atom(name: '_BoardStore.ruleLineNo', context: context);

  @override
  int? get ruleLineNo {
    _$ruleLineNoAtom.reportRead();
    return super.ruleLineNo;
  }

  @override
  set ruleLineNo(int? value) {
    _$ruleLineNoAtom.reportWrite(value, super.ruleLineNo, () {
      super.ruleLineNo = value;
    });
  }

  late final _$numMovesMadeAtom =
      Atom(name: '_BoardStore.numMovesMade', context: context);

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

  late final _$episodeNoAtom =
      Atom(name: '_BoardStore.episodeNo', context: context);

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

  late final _$stackMemoryDepthAtom =
      Atom(name: '_BoardStore.stackMemoryDepth', context: context);

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

  late final _$movesLeftToStayInBonusAtom =
      Atom(name: '_BoardStore.movesLeftToStayInBonus', context: context);

  @override
  int? get movesLeftToStayInBonus {
    _$movesLeftToStayInBonusAtom.reportRead();
    return super.movesLeftToStayInBonus;
  }

  @override
  set movesLeftToStayInBonus(int? value) {
    _$movesLeftToStayInBonusAtom
        .reportWrite(value, super.movesLeftToStayInBonus, () {
      super.movesLeftToStayInBonus = value;
    });
  }

  late final _$transitionMapAtom =
      Atom(name: '_BoardStore.transitionMap', context: context);

  @override
  TransitionMap? get transitionMap {
    _$transitionMapAtom.reportRead();
    return super.transitionMap;
  }

  @override
  set transitionMap(TransitionMap? value) {
    _$transitionMapAtom.reportWrite(value, super.transitionMap, () {
      super.transitionMap = value;
    });
  }

  late final _$episodeIdAtom =
      Atom(name: '_BoardStore.episodeId', context: context);

  @override
  String? get episodeId {
    _$episodeIdAtom.reportRead();
    return super.episodeId;
  }

  @override
  set episodeId(String? value) {
    _$episodeIdAtom.reportWrite(value, super.episodeId, () {
      super.episodeId = value;
    });
  }

  late final _$maxPointsAtom =
      Atom(name: '_BoardStore.maxPoints', context: context);

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

  late final _$giveUpAtAtom =
      Atom(name: '_BoardStore.giveUpAt', context: context);

  @override
  int? get giveUpAt {
    _$giveUpAtAtom.reportRead();
    return super.giveUpAt;
  }

  @override
  set giveUpAt(int? value) {
    _$giveUpAtAtom.reportWrite(value, super.giveUpAt, () {
      super.giveUpAt = value;
    });
  }

  late final _$feedbackSwitchesAtom =
      Atom(name: '_BoardStore.feedbackSwitches', context: context);

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

  late final _$pageAtom = Atom(name: '_BoardStore.page', context: context);

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

  late final _$playerIdAtom =
      Atom(name: '_BoardStore.playerId', context: context);

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

  late final _$expAtom = Atom(name: '_BoardStore.exp', context: context);

  @override
  String get exp {
    _$expAtom.reportRead();
    return super.exp;
  }

  @override
  set exp(String value) {
    _$expAtom.reportWrite(value, super.exp, () {
      super.exp = value;
    });
  }

  late final _$emailAtom = Atom(name: '_BoardStore.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$nicknameAtom =
      Atom(name: '_BoardStore.nickname', context: context);

  @override
  String get nickname {
    _$nicknameAtom.reportRead();
    return super.nickname;
  }

  @override
  set nickname(String value) {
    _$nicknameAtom.reportWrite(value, super.nickname, () {
      super.nickname = value;
    });
  }

  late final _$anonAtom = Atom(name: '_BoardStore.anon', context: context);

  @override
  bool get anon {
    _$anonAtom.reportRead();
    return super.anon;
  }

  @override
  set anon(bool value) {
    _$anonAtom.reportWrite(value, super.anon, () {
      super.anon = value;
    });
  }

  late final _$userAtom = Atom(name: '_BoardStore.user', context: context);

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$ruleInfoListAtom =
      Atom(name: '_BoardStore.ruleInfoList', context: context);

  @override
  List<RuleInfo>? get ruleInfoList {
    _$ruleInfoListAtom.reportRead();
    return super.ruleInfoList;
  }

  @override
  set ruleInfoList(List<RuleInfo>? value) {
    _$ruleInfoListAtom.reportWrite(value, super.ruleInfoList, () {
      super.ruleInfoList = value;
    });
  }

  late final _$loadTrialsAsyncAction =
      AsyncAction('_BoardStore.loadTrials', context: context);

  @override
  Future<void> loadTrials(BuildContext context) {
    return _$loadTrialsAsyncAction.run(() => super.loadTrials(context));
  }

  late final _$newEpisodeAsyncAction =
      AsyncAction('_BoardStore.newEpisode', context: context);

  @override
  Future<void> newEpisode() {
    return _$newEpisodeAsyncAction.run(() => super.newEpisode());
  }

  late final _$updateEpisodeAsyncAction =
      AsyncAction('_BoardStore.updateEpisode', context: context);

  @override
  Future<void> updateEpisode(Para para, String episodeId) {
    return _$updateEpisodeAsyncAction
        .run(() => super.updateEpisode(para, episodeId));
  }

  late final _$updateBoardAsyncAction =
      AsyncAction('_BoardStore.updateBoard', context: context);

  @override
  Future<void> updateBoard() {
    return _$updateBoardAsyncAction.run(() => super.updateBoard());
  }

  late final _$moveAsyncAction =
      AsyncAction('_BoardStore.move', context: context);

  @override
  Future<void> move(int boardObjectId, int bucket) {
    return _$moveAsyncAction.run(() => super.move(boardObjectId, bucket));
  }

  late final _$giveUpAsyncAction =
      AsyncAction('_BoardStore.giveUp', context: context);

  @override
  Future<void> giveUp() {
    return _$giveUpAsyncAction.run(() => super.giveUp());
  }

  late final _$guessAsyncAction =
      AsyncAction('_BoardStore.guess', context: context);

  @override
  Future<void> guess(String data, int confidence) {
    return _$guessAsyncAction.run(() => super.guess(data, confidence));
  }

  late final _$skipGuessAsyncAction =
      AsyncAction('_BoardStore.skipGuess', context: context);

  @override
  Future<void> skipGuess() {
    return _$skipGuessAsyncAction.run(() => super.skipGuess());
  }

  late final _$loadNextBonusAsyncAction =
      AsyncAction('_BoardStore.loadNextBonus', context: context);

  @override
  Future<void> loadNextBonus() {
    return _$loadNextBonusAsyncAction.run(() => super.loadNextBonus());
  }

  late final _$pickAsyncAction =
      AsyncAction('_BoardStore.pick', context: context);

  @override
  Future<void> pick(int boardObjectId) {
    return _$pickAsyncAction.run(() => super.pick(boardObjectId));
  }

  late final _$recordDemographicsAsyncAction =
      AsyncAction('_BoardStore.recordDemographics', context: context);

  @override
  Future<void> recordDemographics(String demographics) {
    return _$recordDemographicsAsyncAction
        .run(() => super.recordDemographics(demographics));
  }

  late final _$activateBonusAsyncAction =
      AsyncAction('_BoardStore.activateBonus', context: context);

  @override
  Future<void> activateBonus() {
    return _$activateBonusAsyncAction.run(() => super.activateBonus());
  }

  late final _$loadPlayerIdAsyncAction =
      AsyncAction('_BoardStore.loadPlayerId', context: context);

  @override
  Future<void> loadPlayerId({bool regenerate = false}) {
    return _$loadPlayerIdAsyncAction
        .run(() => super.loadPlayerId(regenerate: regenerate));
  }

  late final _$registerUserAsyncAction =
      AsyncAction('_BoardStore.registerUser', context: context);

  @override
  Future<void> registerUser() {
    return _$registerUserAsyncAction.run(() => super.registerUser());
  }

  late final _$_BoardStoreActionController =
      ActionController(name: '_BoardStore', context: context);

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
  void setExp(String exp) {
    final _$actionInfo =
        _$_BoardStoreActionController.startAction(name: '_BoardStore.setExp');
    try {
      return super.setExp(exp);
    } finally {
      _$_BoardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAnon(bool anon) {
    final _$actionInfo =
        _$_BoardStoreActionController.startAction(name: '_BoardStore.setAnon');
    try {
      return super.setAnon(anon);
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
playerId: ${playerId},
exp: ${exp},
email: ${email},
nickname: ${nickname},
anon: ${anon},
user: ${user},
ruleInfoList: ${ruleInfoList},
isGameCompleted: ${isGameCompleted},
displayBucketBins: ${displayBucketBins},
hasMoreBonusRounds: ${hasMoreBonusRounds},
ruleNum: ${ruleNum}
    ''';
  }
}
