class SpecialShape {
  static const BUCKET = 'BUCKET';
  static const HAPPY = 'HAPPY';
  static const UNHAPPY = 'UNHAPPY';
  static const CHECK = 'CHECK';
  static const X = 'X';
  static const CLOSE = 'CLOSE';
}

const ROWS = 8;
const COLS = 8;

const PIECES_ROWS = ROWS - 2;
const PIECES_COLS = COLS - 2;

const FEEDBACK_DURATION = 1000;

const DEMOGRAPHICS_DIR = 'demographics';

const PAUSE_OPACITY = 0.5;

const BUCKET_COLOR = 'RED';

class PREF_KEY {
  static const LAST_GUESS = 'LAST_GUESS';
  static const LAST_GUESS_SERIES_NO = 'LAST_GUESS_SERIES_NO';
  static const LAST_GUESS_PLAYER_ID = 'LAST_GUESS_PLAYER_ID';
  static const LAST_GUESS_EXP = 'LAST_GUESS_EXP';
  static const WORKER_ID = 'WORKER_ID';
}
