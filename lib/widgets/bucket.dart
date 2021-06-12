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

  Bucket({required this.pos});

  @override
  Widget build(BuildContext context) {
    final boardStore = Provider.of<BoardStore>(context);
    final hover = useState(false);

    return Container(
      constraints: BoxConstraints.expand(),
      child: DragTarget<BoardObject>(
        onAccept: (boardObject) {
          hover.value = false;
          boardStore.move(boardObject.id, pos);
        },
        onWillAccept: (_) => true,
        onMove: (_) {
          hover.value = true;
        },
        onLeave: (_) {
          hover.value = false;
        },
        builder: (context, List<BoardObject?> candidateData, rejectedData) =>
            Transform.scale(
          scale: hover.value ? 4.0 : 1.0,
          child: Observer(
            builder: (_) => Shape(
              shape: boardStore.bucketShapes[pos]!,
              // color: boardStore.bucketShapes[pos] == SpecialShape.BUCKET
              //     ? BUCKET_COLOR
              //     : null,
              opacity: (boardStore.isPaused &&
                          boardStore.bucketShapes[pos] ==
                              SpecialShape.BUCKET) ||
                      hover.value
                  ? PAUSE_OPACITY
                  : 1,
            ),
          ),
        ),
      ),
    );
  }
}
