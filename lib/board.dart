import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:rulegamemobile/constants/constants.dart';
import 'package:rulegamemobile/piece.dart';
import 'package:rulegamemobile/shape.dart';

class Board extends HookWidget {
  @override
  Widget build(BuildContext context) {
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
//            GridPlacement(
//              child: DragTarget(
//                onWillAccept: (data) => true,
//                builder: (context, List<String> candidateData, rejectedData) =>
//                    SvgPicture.asset('assets/bucket.svg'),
//              ),
//              rowStart: 0,
//              columnStart: 0,
//            ),
            GridPlacement(
              child: DragTarget(
                onWillAccept: (data) => true,
                builder: (context, List<Object?> candidateData, rejectedData) =>
                    Shape(shape: SepecialShape.BUCKET),
              ),
              rowStart: 0,
              columnStart: 0,
            ),
            GridPlacement(
              child: Shape(shape: SepecialShape.BUCKET),
              rowStart: 2,
              columnStart: 2,
            ),
            GridPlacement(
              child: Shape(shape: SepecialShape.BUCKET),
              rowStart: 0,
              columnStart: 2,
            ),
            GridPlacement(
              child: Shape(shape: SepecialShape.BUCKET),
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
                child: LayoutGrid(
                  templateColumnSizes: [
                    FlexibleTrackSize(1),
                    FlexibleTrackSize(1),
                    FlexibleTrackSize(1),
                    FlexibleTrackSize(1),
                    FlexibleTrackSize(1),
                    FlexibleTrackSize(1),
                  ],
                  templateRowSizes: [
                    FlexibleTrackSize(1),
                    FlexibleTrackSize(1),
                    FlexibleTrackSize(1),
                    FlexibleTrackSize(1),
                    FlexibleTrackSize(1),
                    FlexibleTrackSize(1),
                  ],
                  children: [
                    GridPlacement(
                      child: Piece(shape: 'CLOUD', color: 'RED'),
                      rowStart: 0,
                      columnStart: 0,
                      rowSpan: 1,
                      columnSpan: 1,
                    ),
                    GridPlacement(
                      child: Piece(shape: 'TRIANGLE', color: 'BLUE'),
                      rowStart: 0,
                      columnStart: 1,
                      rowSpan: 1,
                      columnSpan: 1,
                    ),
                    GridPlacement(
                      child: Piece(shape: 'CIRCLE', color: 'YELLOW'),
                      rowStart: 0,
                      columnStart: 2,
                      rowSpan: 1,
                      columnSpan: 1,
                    ),
                    GridPlacement(
                      child: Piece(shape: 'STAR', color: 'BLACK'),
                      rowStart: 0,
                      columnStart: 3,
                      rowSpan: 1,
                      columnSpan: 1,
                    ),
                    GridPlacement(
                      child: Piece(shape: 'SQUARE', color: 'BLUE'),
                      rowStart: 0,
                      columnStart: 4,
                      rowSpan: 1,
                      columnSpan: 1,
                    ),
                    GridPlacement(
                      child: Piece(shape: 'SQUARE', color: 'BLACK'),
                      rowStart: 0,
                      columnStart: 5,
                      rowSpan: 1,
                      columnSpan: 1,
                    ),
                  ],
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

//class Board extends HookWidget {
//  @override
//  Widget build(BuildContext context) {
//    return AspectRatio(
//        aspectRatio: 1,
//        child: Container(
//            decoration: BoxDecoration(
//              border: Border.all(
//                  width: 2.0, color: const Color.fromRGBO(255, 0, 0, 1.0)),
//            ),
//            child: GridView.count(
//              physics: const NeverScrollableScrollPhysics(),
//              // Create a grid with 2 columns. If you change the scrollDirection to
//              // horizontal, this produces 2 rows.
//              crossAxisCount: 8,
//              // Generate 100 widgets that display their index in the List.
//              children: List.generate(64, (index) {
//                return Center(
//                  child: Image.asset(
//                      'assets/bucket.svg'
//                  ),
//                );
//              }),
//            )));
//  }
//}
