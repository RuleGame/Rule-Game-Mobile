import 'package:mobx/mobx.dart';
import 'package:rulegamemobile/constants/constants.dart';
import 'package:rulegamemobile/utils/api.dart';
import 'package:rulegamemobile/utils/board.dart';
import 'package:rulegamemobile/utils/models.dart';
import 'package:rulegamemobile/utils/page.dart';

// Include generated file
part 'board.g.dart';

// This is the class used by rest of your codebase
class Board = _Board with _$Board;

// The store-class
abstract class _Board with Store {
  @observable
  Map<int, BoardObject> board = {};

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
  Map<int, String> bucketShapes = {
    BucketPosition.BL: SpecialShape.BUCKET,
    BucketPosition.BR: SpecialShape.BUCKET,
    BucketPosition.TR: SpecialShape.BUCKET,
    BucketPosition.TL: SpecialShape.BUCKET,
  };

  @observable
  bool isPaused = false;

  @observable
  int seriesNo = 0;

  @observable
  List<TranscriptElement> transcript = [];

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
  String episodeId = 'N/A';

  @observable
  double maxPoints = 0;

  @observable
  int? giveUpAt;

  @observable
  String feedbackSwitches = FeedbackSwitches.FIXED;

  @observable
  Page page = PAGE_ORDER[0];

  @observable
  int pageIndex = 0;

  // TODO: Implement logic to generate a random playerId
  @observable
  String playerId = 'test-flutter';

  @action
  void nextPage() {
    page = PAGE_ORDER[pageIndex++];
  }

  @action
  void goToPage(Page page) {
    this.page = page;
    pageIndex = PAGE_ORDER.indexOf(page);
    if (pageIndex == -1) {
      throw Exception('Page $page is not valid');
    }
  }

  @action
  Future<void> loadTrials() async {
    goToPage(Page.LOADING_TRIALS);

    await postPlayerApi(body: PostPlayerReqBody(playerId: playerId));

    final postMostRecentEpisodeResBody = await postMostRecentEpisodeApi(
      body: PostMostRecentEpisodeReqBody(playerId: playerId),
    );
    final noEpisodeStarted = postMostRecentEpisodeResBody.error &&
        postMostRecentEpisodeResBody.errmsg ==
            ErrorMsg.FAILED_TO_FIND_ANY_EPISODE;

    var alreadyFinished = postMostRecentEpisodeResBody.alreadyFinished;
    var episodeId = postMostRecentEpisodeResBody.episodeId;
    var para = postMostRecentEpisodeResBody.para;

    if (noEpisodeStarted) {
      final postNewEpisodeResBody = await postNewEpisodeApi(
          body: PostNewEpisodeReqBody(playerId: playerId));
      alreadyFinished = postNewEpisodeResBody.alreadyFinished;
      episodeId = postNewEpisodeResBody.episodeId;
      para = postNewEpisodeResBody.para;
    }

    showGridMemoryOrder = para.gridMemoryShowOrder;
    stackMemoryDepth = para.stackMemoryDepth;
    showStackMemoryOrder = para.stackMemoryShowOrder;
    this.episodeId = episodeId;
    maxPoints = para.maxPoints;
    feedbackSwitches = para.feedbackSwitches;
    giveUpAt = para.giveUpAt;
    isPaused = false;

    refreshBoard();

    goToPage(Page.TRIALS);
  }

  @action
  Future<void> refreshBoard() async {
    final getDisplayResBody =
        await getDisplayApi(query: GetDisplayReqQuery(episode: episodeId));
    board = {
      for (var boardObject in getDisplayResBody.board.value)
        boardObject.id: boardObject
    };
    isInBonus = getDisplayResBody.bonus;
    bonusEpisodeNo = getDisplayResBody.bonusEpisodeNo;
    canActivateBonus = getDisplayResBody.canActivateBonus;
    finishCode = getDisplayResBody.finishCode;
    totalRewardEarned = getDisplayResBody.totalRewardEarned;
    totalBoardsPredicted = getDisplayResBody.totalBoardsPredicted;
    seriesNo = getDisplayResBody.seriesNo;
    transcript = getDisplayResBody.transcript;
    rulesSrc = getDisplayResBody.rulesSrc;
    ruleLineNo = getDisplayResBody.ruleLineNo;
    numMovesMade = getDisplayResBody.numMovesMade;
    episodeNo = getDisplayResBody.episodeNo;
    movesLeftToStayInBonus = getDisplayResBody.movesLeftToStayInBonus;
    transitionMap = getDisplayResBody.transitionMap;
    isPaused = false;
    bucketShapes = {
      BucketPosition.BL: SpecialShape.BUCKET,
      BucketPosition.BR: SpecialShape.BUCKET,
      BucketPosition.TR: SpecialShape.BUCKET,
      BucketPosition.TL: SpecialShape.BUCKET,
    };
  }

  @action
  Future<void> move(int boardObjectId, int bucket) async {
    final boardObject = board[boardObjectId];
    if (boardObject != null) {
      final postMoveResBody = await postMoveApi(
        body: PostMoveReqBody(
          episode: episodeId,
          x: boardObject.x,
          y: boardObject.y,
          bx: boardPositionToBxBy[bucket]!.bx,
          by: boardPositionToBxBy[bucket]!.by,
          cnt: numMovesMade,
        ),
      );

      if (postMoveResBody.code == Code.ACCEPT) {
        validMove(boardObjectId, bucket);
      } else if (postMoveResBody.code == Code.DENY) {
        invalidMove(boardObjectId, bucket);
      }

      await Future.delayed(const Duration(milliseconds: FEEDBACK_DURATION));
      refreshBoard();
    }
  }

  @action
  Future<void> giveUp() async {}

  @action
  Future<void> guess() async {}

  @action
  Future<void> skipGuess() async {}

  @action
  Future<void> loadNextBonus() async {}

  @action
  Future<void> pick() async {}

  @action
  Future<void> validMove(int boardObjectId, int bucket) async {
    isPaused = true;
//    bucketShapes.
  }

  @action
  Future<void> invalidMove(int boardObjectId, int bucket) async {
    isPaused = true;
  }
}
