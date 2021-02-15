import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rulegamemobile/constants/constants.dart';
import 'package:rulegamemobile/mobx/board.dart';
import 'package:rulegamemobile/utils/models.dart';
import 'package:rulegamemobile/widgets/shape.dart';

class Piece extends HookWidget {
  final BoardObject boardObject;

  Piece({this.boardObject});

  @override
  Widget build(BuildContext context) {
    final boardStore = Provider.of<BoardStore>(context);

    return Container(
      child: Observer(
        builder: (_) => Stack(
          // fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: Observer(
                builder: (_) {
                  // Put isPaused observable inside to avoid the no observable found
                  // warning
                  final canDrag =
                      !boardStore.isPaused && boardObject.buckets.isNotEmpty;
                  return Draggable(
                    maxSimultaneousDrags: canDrag ? 1 : 0,
                    data: boardObject,
                    child: Shape(
                        shape: boardObject.shape, color: boardObject.color),
                    feedback: Container(
                        child: Transform.translate(
                          offset: Offset(-75, -75),
                          child: Shape(
                            shape: boardObject.shape,
                            color: boardObject.color,
                          ),
                        ),
                        width: 100,
                        height: 100),
                    dragAnchor: DragAnchor.pointer,
                  );
                },
              ),
            ),
            if (boardObject.buckets.isEmpty)
              Positioned.fill(child: Shape(shape: SpecialShape.CLOSE)),
            if (boardStore.showGridMemoryOrder)
              Container(
                padding: EdgeInsets.all(0.5),
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Text('${boardStore.getMoveNum(boardObject.id)}'),
              ),
          ],
        ),
      ),
      constraints: BoxConstraints.expand(),
    );
  }
}
