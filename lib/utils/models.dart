class BucketPosition {
  static const TL = 0;
  static const TR = 1;
  static const BR = 2;
  static const BL = 3;
}

class FinishCode {
  static const FINISH = 1;
  static const GIVEN_UP = 3;
  static const LOST = 4;
  static const NO = 0;
  static const STALEMATE = 2;
}

class Code {
  static const ACCEPT = 0;
  static const STALEMATE = 2;
  static const EMPTY_CELL = 3;
  static const DENY = 4;
  static const EXIT = 5;
  static const NEW_GAME = 6;
  static const INVALID_COMMAND = -1;
  static const INVALID_ARGUMENTS = -2;
  static const INVALID_POS = -3;
  static const NO_GAME = -4;
  static const INVALID_RULES = -5;
  static const NO_SUCH_EPISODE = -6;
  static const ATTEMPT_CNT_MISMATCH = -7;
  static const JUST_A_DISPLAY = -8;
}

class FeedbackSwitches {
  static const FIXED = 'fixed';
  static const FREE = 'free';
  static const NEW_DISPLAY_TRIGGER = 'new_display_trigger';
  static const FREE_TRIGGER = 'free_trigger';
}

class ErrorMsg {
  static const FAILED_TO_FIND_ANY_EPISODE = 'Failed to find any episode!';
  static const BONUS_ALREADY_ACTIVATED =
      'Bonus already activated in the current series';
}

class TransitionMap {
  final String main;
  final String bonus;
  final String next;
  final String end;

  TransitionMap.fromJson(Map<String, dynamic> json)
      : main = json['MAIN'],
        bonus = json['BONUS'],
        next = json['NEXT'],
        end = json['END'];
}

class BoardObject {
  final List<int> buckets;
  final String color;
  final int? dropped;
  final int id;
  final String shape;
  final int x;
  final int y;

  BoardObject.fromJson(Map<String, dynamic> json)
      : buckets = List.castFrom(json['buckets']),
        color = json['color'],
        dropped = json['dropped'],
        id = json['id'],
        shape = json['shape'],
        x = json['x'],
        y = json['y'];
}

class Board {
  final double longId;
  final int id;
  final List<BoardObject> value;

  Board.fromJson(Map<String, dynamic> json)
      : longId = json['longId'],
        value = json['value'] != null
            ? (List.castFrom<dynamic, Map<String, dynamic>>(json['value']))
                .map((m) => BoardObject.fromJson(m))
                .toList()
            : [],
        id = json['id'];
}

class RulesSrc {
  final List<int> orders;
  final List<String> rows;

  RulesSrc({this.orders = const [], this.rows = const []});

  factory RulesSrc.fromJson(Map<String, dynamic> json) => RulesSrc(
        orders: List.castFrom(json['orders']),
        rows: List.castFrom(json['rows']),
      );
}

class TranscriptElement {
  final int pos;
  final int? bucketNo;
  final int code;
  final int pieceId;

  TranscriptElement(
      {required this.pos,
      this.bucketNo,
      required this.code,
      required this.pieceId});

  factory TranscriptElement.fromJson(Map<String, dynamic> json) =>
      TranscriptElement(
        pos: json['pos'],
        bucketNo: json['bucketNo'],
        code: json['code'],
        pieceId: json['pieceId'],
      );
}

class Display {
  final Board? board;
  final int finishCode;
  final int numMovesMade;
  final bool bonus;
  final int bonusEpisodeNo;
  final bool canActivateBonus;
  final int episodeNo;
  final bool guessSaved;
  final int seriesNo;
  final int totalBoardsPredicted;
  final double? totalRewardEarned;
  final List<TranscriptElement>? transcript;
  final RulesSrc? rulesSrc;
  final int ruleLineNo;
  final int? movesLeftToStayInBonus;
  final TransitionMap? transitionMap;
  final String ruleSetName;
  final String trialListId;

  Display.fromJson(Map<String, dynamic> json)
      : board = json['board'] != null ? Board.fromJson(json['board']) : null,
        finishCode = json['finishCode'],
        numMovesMade = json['numMovesMade'],
        bonus = json['bonus'],
        bonusEpisodeNo = json['bonusEpisodeNo'],
        canActivateBonus = json['canActivateBonus'],
        episodeNo = json['episodeNo'],
        guessSaved = json['guessSaved'],
        seriesNo = json['seriesNo'],
        totalBoardsPredicted = json['totalBoardsPredicted'],
        totalRewardEarned = (json['totalRewardEarned'] as int?)?.toDouble(),
        transcript = json['transcript'] != null
            ? (List.castFrom<dynamic, Map<String, dynamic>>(json['transcript']))
                .map((m) => TranscriptElement.fromJson(m))
                .toList()
            : null,
        rulesSrc = json['rulesSrc'] != null
            ? RulesSrc.fromJson(json['rulesSrc'])
            : null,
        ruleLineNo = json['ruleLineNo'],
        movesLeftToStayInBonus =
            (json['movesLeftToStayInBonus'] as num?)?.round(),
        transitionMap = json['transitionMap'] != null
            ? TransitionMap.fromJson(json['transitionMap'])
            : null,
        ruleSetName = json['ruleSetName'],
        trialListId = json['trialListId'];
}

class Para {
  final double clearingThreshold;
  final double maxPoints;
  final double b;
  final int minPoints;
  final int maxColors;
  final int f;
  final String feedbackSwitches;
  final int minObjects;
  final int m;
  final int n;
  final int clearHowMany;
  final int bonusExtraPts;
  final String ruleId;
  final int maxObjects;
  final bool gridMemoryShowOrder;
  final int minShapes;
  final bool stackMemoryShowOrder;
  final int maxShapes;
  final int minColors;
  final int stackMemoryDepth;
  final int maxBoards;
  final int activateBonusAt;
  final int? giveUpAt;

  Para.fromJson(Map<String, dynamic> json)
      : clearingThreshold = json['clearing_threshold'],
        maxPoints = (json['max_points'] as int?)?.toDouble() ?? 0.0,
        b = json['b'],
        minPoints = json['min_points'],
        maxColors = json['max_colors'],
        f = json['f'],
        feedbackSwitches = json['feedback_switches'],
        minObjects = json['min_objects'],
        m = json['m'],
        n = json['n'],
        clearHowMany = json['clear_how_many'],
        bonusExtraPts = json['bonus_extra_pts'],
        ruleId = json['rule_id'],
        maxObjects = json['max_objects'],
        gridMemoryShowOrder = json['grid_memory_show_order'],
        minShapes = json['min_shapes'],
        stackMemoryShowOrder = json['stack_memory_show_order'],
        maxShapes = json['max_shapes'],
        minColors = json['min_colors'],
        stackMemoryDepth = json['stack_memory_depth'],
        maxBoards = json['max_boards'],
        activateBonusAt = json['activate_bonus_at'],
        giveUpAt = json['give_up_at'];
}

abstract class ReqQuery {
  Map<String, dynamic> toMap();
}

class DummyReqQuery implements ReqQuery {
  @override
  Map<String, dynamic> toMap() => {};
}

class GetShapeReqQuery implements ReqQuery {
  final String shape;

  GetShapeReqQuery({required this.shape});

  @override
  Map<String, dynamic> toMap() => {'shape': shape};
}

abstract class ReqBody {
  Map<String, dynamic> toMap();
}

class DummyReqBody implements ReqBody {
  @override
  Map<String, dynamic> toMap() => {};
}

abstract class ResBody {
  ResBody.fromJson(Map<String, dynamic> json);
}

class DummyResBody implements ResBody {
  DummyResBody.fromJson(Map<String, dynamic> json);
}

class GetColorMapResBody implements ResBody {
  final String? errmsg;
  final bool error;
  final Map<String, List<int>> colorToRgbMap;

  GetColorMapResBody.fromJson(Map<String, dynamic> json)
      : errmsg = json['errmsg'],
        error = json['error'],
        colorToRgbMap = Map.castFrom<String, dynamic, String, List<int>>({
          for (var k in json.keys)
            if (k != 'error' && k != 'errmsg')
              k: List.castFrom<dynamic, int>(json[k])
        });
}

class PostWriteFileReqBody implements ReqBody {
  final String dir;
  final String file;
  final String data;

  PostWriteFileReqBody({
    required this.dir,
    required this.file,
    required this.data,
  });

  @override
  Map<String, dynamic> toMap() => {
        'dir': dir,
        'file': file,
        'data': data,
      };
}

class PostPlayerResBody implements ResBody {
  final String? errmsg;
  final bool error;
  final bool newlyRegistered;
  final String trialListId;
  final List<Para> trialList;
  final String completionCode;

  PostPlayerResBody({
    required this.errmsg,
    required this.error,
    required this.newlyRegistered,
    required this.trialListId,
    required this.trialList,
    required this.completionCode,
  });

  PostPlayerResBody.fromJson(Map<String, dynamic> json)
      : errmsg = json['errmsg'],
        error = json['error'],
        newlyRegistered = json['newlyRegistered'],
        trialListId = json['trialListId'],
        trialList = List.castFrom(json['trialList']),
        completionCode = json['completionCode'];
}

class PostPlayerReqBody implements ReqBody {
  final String playerId;
  final String exp;

  PostPlayerReqBody({required this.playerId, required this.exp});

  @override
  Map<String, dynamic> toMap() => {
        'playerId': playerId,
        'exp': exp,
      };
}

class PostMostRecentEpisodeResBody implements ResBody {
  final String? errmsg;
  final bool error;
  final bool alreadyFinished;
  final Display? display;
  final String episodeId;
  final Para? para;
  final String completionCode;

  PostMostRecentEpisodeResBody.fromJson(Map<String, dynamic> json)
      : errmsg = json['errmsg'],
        error = json['error'],
        alreadyFinished = json['alreadyFinished'],
        display =
            json['display'] != null ? Display.fromJson(json['display']) : null,
        episodeId = json['episodeId'],
        para = json['para'] != null ? Para.fromJson(json['para']) : null,
        completionCode = json['completionCode'];
}

class PostMostRecentEpisodeReqBody implements ReqBody {
  final String playerId;

  PostMostRecentEpisodeReqBody({required this.playerId});

  @override
  Map<String, dynamic> toMap() => {
        'playerId': playerId,
      };
}

class PostNewEpisodeResBody implements ResBody {
  final String? errmsg;
  final bool error;
  final bool alreadyFinished;
  final Display? display;
  final String episodeId;
  final Para? para;
  final String completionCode;

  PostNewEpisodeResBody.fromJson(Map<String, dynamic> json)
      : errmsg = json['errmsg'],
        error = json['error'],
        alreadyFinished = json['alreadyFinished'],
        display =
            json['display'] != null ? Display.fromJson(json['display']) : null,
        episodeId = json['episodeId'],
        para = json['para'] != null ? Para.fromJson(json['para']) : null,
        completionCode = json['completionCode'];
}

class PostNewEpisodeReqBody implements ReqBody {
  final String playerId;

  PostNewEpisodeReqBody({required this.playerId});

  @override
  Map<String, dynamic> toMap() => {
        'playerId': playerId,
      };
}

class GetDisplayResBody extends Display implements ResBody {
  final int code;
  final String? errmsg;

  GetDisplayResBody.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        errmsg = json['errmsg'],
        super.fromJson(json);
}

class GetDisplayReqQuery implements ReqQuery {
  final String episode;

  GetDisplayReqQuery({required this.episode});

  @override
  Map<String, dynamic> toMap() => {'episode': episode};
}

class PostMoveResBody implements ResBody {
  final Board? board;
  final bool bonus;
  final int code;
  final String? errmsg;
  final int finishCode;
  final int numMovesMade;
  final int totalRewardEarned;

  PostMoveResBody.fromJson(Map<String, dynamic> json)
      : board = json['board'] != null ? Board.fromJson(json['board']) : null,
        bonus = json['bonus'],
        code = json['code'],
        errmsg = json['errmsg'],
        finishCode = json['finishCode'],
        numMovesMade = json['numMovesMade'],
        totalRewardEarned = json['totalRewardEarned'];
}

class PostMoveReqBody implements ReqBody {
  final String episode;
  final int x;
  final int y;
  final int bx;
  final int by;
  final int cnt;

  PostMoveReqBody({
    required this.episode,
    required this.x,
    required this.y,
    required this.bx,
    required this.by,
    required this.cnt,
  });

  @override
  Map<String, dynamic> toMap() => {
        'episode': episode,
        'x': x,
        'y': y,
        'bx': bx,
        'by': by,
        'cnt': cnt,
      };
}

class PostPickResBody implements ResBody {
  final Board? board;
  final bool bonus;
  final int code;
  final String? errmsg;
  final int finishCode;
  final int numMovesMade;
  final int totalRewardEarned;

  PostPickResBody.fromJson(Map<String, dynamic> json)
      : board = json['board'] != null ? Board.fromJson(json['board']) : null,
        bonus = json['bonus'],
        code = json['code'],
        errmsg = json['errmsg'],
        finishCode = json['finishCode'],
        numMovesMade = json['numMovesMade'],
        totalRewardEarned = json['totalRewardEarned'];
}

class PostPickReqBody implements ReqBody {
  final String episode;
  final int x;
  final int y;
  final int cnt;

  PostPickReqBody({
    required this.episode,
    required this.x,
    required this.y,
    required this.cnt,
  });

  @override
  Map<String, dynamic> toMap() => {
        'episode': episode,
        'x': x,
        'y': y,
        'cnt': cnt,
      };
}

class PostActivateBonusResBody implements ResBody {
  final String? errmsg;
  final bool error;

  PostActivateBonusResBody.fromJson(Map<String, dynamic> json)
      : errmsg = json['errmsg'],
        error = json['error'];
}

class PostActivateBonusReqBody implements ReqBody {
  final String playerId;

  PostActivateBonusReqBody({required this.playerId});

  @override
  Map<String, dynamic> toMap() => {
        'playerId': playerId,
      };
}

class PostGiveUpResBody implements ResBody {
  final String? errmsg;
  final bool error;

  PostGiveUpResBody.fromJson(Map<String, dynamic> json)
      : errmsg = json['errmsg'],
        error = json['error'];
}

class PostGiveUpReqBody implements ReqBody {
  final String playerId;
  final int seriesNo;

  PostGiveUpReqBody({required this.playerId, required this.seriesNo});

  @override
  Map<String, dynamic> toMap() => {
        'playerId': playerId,
        'seriesNo': seriesNo,
      };
}

class PostGuessResBody implements ResBody {
  final String? errmsg;
  final bool error;
  final int byteCnt;
  final String path;

  PostGuessResBody.fromJson(Map<String, dynamic> json)
      : errmsg = json['errmsg'],
        error = json['error'],
        byteCnt = json['byteCnt'],
        path = json['path'];
}

class PostGuessReqBody implements ReqBody {
  final String episode;
  final String data;
  final int confidence;

  PostGuessReqBody({
    required this.episode,
    required this.data,
    required this.confidence,
  });

  @override
  Map<String, dynamic> toMap() => {
        'episode': episode,
        'data': data,
        'confidence': confidence,
      };
}

class RuleInfo {
  final bool completed;
  final List<String> description;
  final String display;
  final int episodeCnt;
  final String exp;
  final String name;
  final String? playerId;

  RuleInfo.fromJson(Map<String, dynamic> json)
      : completed = json['completed'],
        description = List.castFrom(json['description']),
        display = json['display'],
        episodeCnt = json['episodeCnt'],
        exp = json['exp'],
        name = json['name'],
        playerId = json['playerId'];
}

class GetFindPlansResBody implements ResBody {
  final bool error;
  final List<RuleInfo> ruleInfo;
  final String? errmsg;

  GetFindPlansResBody.fromJson(Map<String, dynamic> json)
      : error = json['error'],
        ruleInfo = fromJsonList(json['ruleInfo'], RuleInfo.fromJson),
        errmsg = json['errmsg'];
}

class GetFindPlansReqQuery implements ReqQuery {
  final int uid;

  GetFindPlansReqQuery({required this.uid});

  @override
  Map<String, dynamic> toMap() => {'uid': uid};
}

class User {
 final String date;
 final String? email;
 final int id;
 final String idCode;
 final String? nickname;

 User.fromJson(Map<String, dynamic> json)
     : date = json['date'],
       email = json['email'],
       id = json['id'],
       idCode = json['idCode'],
       nickname = json['nickname'];
}

class PostRegisterUserResBody implements ResBody {
  final bool error;
  final bool newlyRegistered;
  final User? user;
  final String? errmsg;

  PostRegisterUserResBody.fromJson(Map<String, dynamic> json)
      : error = json['error'],
        newlyRegistered = json['newlyRegistered'],
        user = json['user'] != null ? User.fromJson(json['user']) : null,
        errmsg = json['errmsg'];
}

class PostRegisterUserReqBody implements ReqBody {
  final String email;
  final String nickname;
  final bool? anon;

  PostRegisterUserReqBody({
    required this.email,
    required this.nickname,
    this.anon,
  });

  @override
  Map<String, dynamic> toMap() => {
    'email': email,
    'nickname': nickname,
    'anon': anon,
  };
}

List<T> fromJsonList<T>(dynamic value, T Function(Map<String, dynamic> element) fromJson) {
  return value != null
      ? (List.castFrom<dynamic, Map<String, dynamic>>(value))
      .map((m) => fromJson(m))
      .toList()
      : [];
}