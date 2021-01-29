import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rulegamemobile/constants/constants.dart';
import 'package:rulegamemobile/mobx/board.dart';
import 'package:rulegamemobile/utils/models.dart';
import 'package:rulegamemobile/widgets/shape.dart';

class Bucket extends HookWidget {
  final int pos;

  Bucket({this.pos});

  @override
  Widget build(BuildContext context) {
    final boardStore = Provider.of<BoardStore>(context);

    return Container(
      child: DragTarget<BoardObject>(
        onAccept: (boardObject) => boardStore.move(boardObject.id, pos),
        onWillAccept: (_) => true,
        builder: (context, List<Object> candidateData, rejectedData) =>
            Observer(
          builder: (_) => Shape(
            shape: boardStore.bucketShapes[pos],
            color: boardStore.bucketShapes[pos] == SpecialShape.BUCKET
                ? BUCKET_COLOR
                : null,
            opacity: boardStore.isPaused &&
                    boardStore.bucketShapes[pos] == SpecialShape.BUCKET
                ? PAUSE_OPACITY
                : 1,
          ),
        ),
      ),
      constraints: BoxConstraints.expand(),
    );
  }
}
