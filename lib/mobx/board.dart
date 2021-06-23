import 'package:mobx/mobx.dart';
import 'package:rulegamemobile/constants/constants.dart';
import 'package:rulegamemobile/utils/api.dart';
import 'package:rulegamemobile/utils/board.dart';
import 'package:rulegamemobile/utils/models.dart';
import 'package:rulegamemobile/utils/page.dart';
import 'package:rulegamemobile/utils/username_gen.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Include generated file
part 'board.g.dart';

// This is the class used by rest of your codebase
class BoardStore = _BoardStore with _$BoardStore;

// The store-class
abstract class _BoardStore with Store {
  @observable
  ObservableMap<int, BoardObject> board = ObservableMap.of({});

  @observable
  bool isInBonus = false;

  @observable
  int bonusEpisodeNo = 0;

  @observable
  bool canActivateBonus = false;

  @observable
  int finishCode = FinishCode.NO;

  @observable
  double totalRewardEarned = 0;

  @observable
  int totalBoardsPredicted = 0;

  @observable
  bool showGridMemoryOrder = false;

  @observable
  bool showStackMemoryOrder = false;

  @observable
  ObservableMap<int, String> bucketShapes = ObservableMap.of({
    BucketPosition.BL: SpecialShape.BUCKET,
    BucketPosition.BR: SpecialShape.BUCKET,
    BucketPosition.TR: SpecialShape.BUCKET,
    BucketPosition.TL: SpecialShape.BUCKET,
  });

  @observable
  bool isPaused = false;

  @observable
  int seriesNo = 0;

  @observable
  ObservableList<TranscriptElement> transcript = ObservableList.of([]);

  @observable
  RulesSrc rulesSrc = RulesSrc();

  @observable
  int? ruleLineNo;

  @observable
  int numMovesMade = 0;

  @observable
  int episodeNo = 0;

  @observable
  int stackMemoryDepth = 0;

  @observable
  int? movesLeftToStayInBonus;

  @observable
  TransitionMap? transitionMap;

  @observable
  String? episodeId;

  @observable
  double maxPoints = 0;

  @observable
  int? giveUpAt;

  @observable
  String feedbackSwitches = FeedbackSwitches.FIXED;

  @observable
  Page page = Page.INTRODUCTION;

  // playerId must be loaded first before accessing it
  @observable
  String playerId = 'UNSET';

  @observable
  String exp = EXPERIMENT;

  @computed
  bool get isGameCompleted =>
      finishCode == FinishCode.STALEMATE ||
      finishCode == FinishCode.LOST ||
      finishCode == FinishCode.GIVEN_UP ||
      finishCode == FinishCode.FINISH;

  Iterable<BoardObject> binBoardObjects(int bucketPosition) =>
      transcript.reversed
          .where(
            (step) =>
                step.bucketNo != null &&
                step.code == Code.ACCEPT &&
                step.bucketNo == bucketPosition,
          )
          .take(stackMemoryDepth)
          .map((step) => board[step.pieceId]!);

  @computed
  bool get displayBucketBins => stackMemoryDepth > 0;

  @computed
  bool get hasMoreBonusRounds =>
      isInBonus && (transitionMap?.bonus == 'DEFAULT');

  int getMoveNum(int boardObjectId) =>
      transcript.indexWhere((step) =>
          step.pieceId == boardObjectId &&
          step.bucketNo != null &&
          step.code == Code.ACCEPT) +
      1;

  @computed
  int get ruleNum => seriesNo + 1;

  @action
  void goToPage(Page page) {
    this.page = page;
  }

  @action
  // TODO: Pass context as an argument to show dialog on network errors
  Future<void> loadTrials() async {
    await loadPlayerId();

    goToPage(Page.LOADING_TRIALS);

    await postPlayerApi(body: PostPlayerReqBody(playerId: playerId, exp: exp));

    final postMostRecentEpisodeResBody = await postMostRecentEpisodeApi(
      body: PostMostRecentEpisodeReqBody(playerId: playerId),
    );
    final noEpisodeStarted = postMostRecentEpisodeResBody.error &&
        postMostRecentEpisodeResBody.errmsg ==
            ErrorMsg.FAILED_TO_FIND_ANY_EPISODE;

    goToPage(Page.TRIALS);

    if (noEpisodeStarted) {
      await newEpisode();
    } else {
      await updateEpisode(
        postMostRecentEpisodeResBody.para!,
        postMostRecentEpisodeResBody.episodeId,
      );
      await updateBoard();
    }
  }

  @action
  Future<void> newEpisode() async {
    final postNewEpisodeResBody = await postNewEpisodeApi(
        body: PostNewEpisodeReqBody(playerId: playerId));
    episodeId = postNewEpisodeResBody.episodeId;

    if (postNewEpisodeResBody.alreadyFinished) {
      goToPage(Page.DEMOGRAPHICS_INSTRUCTIONS);
    } else {
      await updateEpisode(
        postNewEpisodeResBody.para!,
        postNewEpisodeResBody.episodeId,
      );
      await updateBoard();
      goToPage(Page.TRIALS);
    }
    isPaused = false;
  }

  @action
  Future<void> updateEpisode(Para para, String episodeId) async {
    showGridMemoryOrder = para.gridMemoryShowOrder;
    stackMemoryDepth = para.stackMemoryDepth;
    showStackMemoryOrder = para.stackMemoryShowOrder;
    this.episodeId = episodeId;
    maxPoints = para.maxPoints;
    feedbackSwitches = para.feedbackSwitches;
    giveUpAt = para.giveUpAt;
  }

  @action
  Future<void> updateBoard() async {
    final getDisplayResBody =
        await getDisplayApi(query: GetDisplayReqQuery(episode: episodeId!));
    if (getDisplayResBody.code < 0 &&
        getDisplayResBody.code != Code.JUST_A_DISPLAY) {
      throw Exception(getDisplayResBody.errmsg);
    }
    // getDisplayResBody.board might be null when code is JUST_A_DISPLAY
    if (getDisplayResBody.code == Code.JUST_A_DISPLAY &&
        getDisplayResBody.board == null) {
      await newEpisode();
    } else {
      board = ObservableMap.of({
        for (var boardObject in getDisplayResBody.board!.value)
          boardObject.id: boardObject
      });

      isInBonus = getDisplayResBody.bonus;
      bonusEpisodeNo = getDisplayResBody.bonusEpisodeNo;
      canActivateBonus = getDisplayResBody.canActivateBonus;
      finishCode = getDisplayResBody.finishCode;
      totalRewardEarned = getDisplayResBody.totalRewardEarned!;
      totalBoardsPredicted = getDisplayResBody.totalBoardsPredicted;
      seriesNo = getDisplayResBody.seriesNo;
      transcript = ObservableList.of(getDisplayResBody.transcript!);
      rulesSrc = getDisplayResBody.rulesSrc!;
      ruleLineNo = getDisplayResBody.ruleLineNo;
      numMovesMade = getDisplayResBody.numMovesMade;
      episodeNo = getDisplayResBody.episodeNo;
      movesLeftToStayInBonus = getDisplayResBody.movesLeftToStayInBonus;
      transitionMap = getDisplayResBody.transitionMap;
      isPaused = false;
      bucketShapes = ObservableMap.of({
        BucketPosition.BL: SpecialShape.BUCKET,
        BucketPosition.BR: SpecialShape.BUCKET,
        BucketPosition.TR: SpecialShape.BUCKET,
        BucketPosition.TL: SpecialShape.BUCKET,
      });
    }
  }

  @action
  Future<void> move(int boardObjectId, int bucket) async {
    final boardObject = board[boardObjectId]!;
    final postMoveResBody = await postMoveApi(
      body: PostMoveReqBody(
        episode: episodeId!,
        x: boardObject.x,
        y: boardObject.y,
        bx: boardPositionToBxBy[bucket]!.bx,
        by: boardPositionToBxBy[bucket]!.by,
        cnt: numMovesMade,
      ),
    );
    if (postMoveResBody.code < 0 &&
        postMoveResBody.code != Code.JUST_A_DISPLAY) {
      throw Exception(postMoveResBody.errmsg);
    }

    if (postMoveResBody.code == Code.ACCEPT) {
      isPaused = true;
      bucketShapes[bucket] = SpecialShape.HAPPY;
    } else if (postMoveResBody.code == Code.DENY) {
      isPaused = true;
      bucketShapes[bucket] = SpecialShape.UNHAPPY;
    }
    numMovesMade = postMoveResBody.numMovesMade;

    await Future.delayed(const Duration(milliseconds: FEEDBACK_DURATION));
    await updateBoard();
  }

  @action
  Future<void> giveUp() async {
    await postGiveUpBonusApi(
      body: PostGiveUpReqBody(playerId: playerId, seriesNo: seriesNo),
    );

    await updateBoard();
  }

  @action
  Future<void> guess(String data, int confidence) async {
    await postGuessApi(
      body: PostGuessReqBody(
        episode: episodeId!,
        data: data,
        confidence: confidence,
      ),
    );

    await newEpisode();
  }

  @action
  Future<void> skipGuess() async {
    await newEpisode();
  }

  @action
  Future<void> loadNextBonus() async {
    await newEpisode();
  }

  @action
  Future<void> pick(int boardObjectId) async {
    final boardObject = board[boardObjectId]!;
    await postPickApi(
      body: PostPickReqBody(
        episode: episodeId!,
        x: boardObject.x,
        y: boardObject.y,
        cnt: numMovesMade,
      ),
    );

    await updateBoard();
  }

  @action
  void setIsInBonus(bool isInBonus) {
    this.isInBonus = isInBonus;
  }

  @action
  Future<void> recordDemographics(String demographics) async {
    await postWriteFileApi(
      body: PostWriteFileReqBody(
        dir: DEMOGRAPHICS_DIR,
        file: '$playerId.csv',
        data: demographics,
      ),
    );

    goToPage(Page.DEBRIEFING);
  }

  @action
  Future<void> activateBonus() async {
    await postActivateBonusApi(
      body: PostActivateBonusReqBody(playerId: playerId),
    );
  }

  @action
  Future<void> loadPlayerId({bool regenerate = false}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    if (!prefs.containsKey(PrefKey.PLAYER_ID_PREFIX)) {
      await prefs.setString(
        PrefKey.PLAYER_ID_PREFIX,
        'mobile-${UsernameGen().generate()}',
      );
    }

    if (!regenerate && prefs.containsKey(PrefKey.PLAYER_ID)) {
      playerId = prefs.get(PrefKey.PLAYER_ID) as String;
    } else {
      final prefix = prefs.getString(
        PrefKey.PLAYER_ID_PREFIX,
      );
      playerId = '$prefix-${DateTime.now().millisecondsSinceEpoch}';
      await prefs.setString(PrefKey.PLAYER_ID, playerId);
    }
  }
}
