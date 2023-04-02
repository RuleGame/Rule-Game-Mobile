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
    final boardStore = Provider.of<BoardStore>(context);

    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        child: LayoutGrid(
          columnSizes: [
            FlexibleTrackSize(1),
            FlexibleTrackSize(6),
            FlexibleTrackSize(1)
          ],
          rowSizes: [
            FlexibleTrackSize(1),
            FlexibleTrackSize(6),
            FlexibleTrackSize(1)
          ],
          children: [
            GridPlacement(
              rowStart: 0,
              columnStart: 0,
              child: Bucket(pos: BucketPosition.TL),
            ),
            GridPlacement(
              rowStart: 2,
              columnStart: 2,
              child: Bucket(pos: BucketPosition.BR),
            ),
            GridPlacement(
              rowStart: 0,
              columnStart: 2,
              child: Bucket(pos: BucketPosition.TR),
            ),
            GridPlacement(
              rowStart: 2,
              columnStart: 0,
              child: Bucket(pos: BucketPosition.BL),
            ),
            GridPlacement(
              rowStart: 1,
              columnStart: 1,
              child: Container(
                child: Observer(
                  builder: (_) {
                    final boardObjects = boardStore.board.values;

                    return LayoutGrid(
                    rowSizes:
                        List.generate(PIECES_ROWS, (_) => FlexibleTrackSize(1)),
                    columnSizes:
                        List.generate(PIECES_COLS, (_) => FlexibleTrackSize(1)),
                    children: [
                      for (var boardObject in boardObjects)
                        GridPlacement(
                          key: Key('${boardObject.id}'),
                          rowStart: PIECES_ROWS - boardObject.y,
                          columnStart: boardObject.x - 1,
                          rowSpan: 1,
                          columnSpan: 1,
                          child: Piece(boardObject: boardObject),
                        ),
                    ],
                  );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
