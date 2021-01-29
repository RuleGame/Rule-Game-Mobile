import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rulegamemobile/constants/constants.dart';
import 'package:rulegamemobile/mobx/board.dart';
import 'package:rulegamemobile/utils/models.dart';
import 'package:rulegamemobile/widgets/bucket.dart';
import 'package:rulegamemobile/widgets/piece.dart';

class Board extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<BoardStore>(context);

    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 2.0,
            color: const Color.fromRGBO(255, 0, 0, 1.0),
          ),
        ),
        child: LayoutGrid(
          templateColumnSizes: [
            FlexibleTrackSize(1),
            FlexibleTrackSize(6),
            FlexibleTrackSize(1)
          ],
          templateRowSizes: [
            FlexibleTrackSize(1),
            FlexibleTrackSize(6),
            FlexibleTrackSize(1)
          ],
          children: [
            GridPlacement(
              child: Bucket(pos: BucketPosition.TL),
              rowStart: 0,
              columnStart: 0,
            ),
            GridPlacement(
              child: Bucket(pos: BucketPosition.BR),
              rowStart: 2,
              columnStart: 2,
            ),
            GridPlacement(
              child: Bucket(pos: BucketPosition.TR),
              rowStart: 0,
              columnStart: 2,
            ),
            GridPlacement(
              child: Bucket(pos: BucketPosition.BL),
              rowStart: 2,
              columnStart: 0,
            ),
            GridPlacement(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2.0,
                    color: const Color.fromRGBO(255, 0, 0, 1.0),
                  ),
                ),
                child: Observer(
                  builder: (_) => LayoutGrid(
                    templateRowSizes:
                        List.generate(PIECES_ROWS, (_) => FlexibleTrackSize(1)),
                    templateColumnSizes:
                        List.generate(PIECES_COLS, (_) => FlexibleTrackSize(1)),
                    children: [
                      for (var boardObject in store.board.values)
                        GridPlacement(
                          child: Piece(boardObject: boardObject),
                          rowStart: PIECES_ROWS - boardObject.y,
                          columnStart: boardObject.x - 1,
                          rowSpan: 1,
                          columnSpan: 1,
                        ),
                    ],
                  ),
                ),
              ),
              rowStart: 1,
              columnStart: 1,
            )
          ],
        ),
      ),
    );
  }
}
