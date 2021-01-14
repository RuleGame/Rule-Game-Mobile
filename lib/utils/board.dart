import 'package:rulegamemobile/constants/constants.dart';

class BoardMap {
  final int bx;
  final int by;

  BoardMap({this.bx, this.by});
}

final boardPositionToBxBy = {
  0: BoardMap(bx: 0, by: ROWS - 1),
  1: BoardMap(bx: COLS - 1, by: ROWS - 1),
  2: BoardMap(bx: COLS - 1, by: 0),
  3: BoardMap(bx: 0, by: 0),
};
