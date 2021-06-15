import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rulegamemobile/mobx/board.dart';
import 'package:rulegamemobile/utils/models.dart';
import 'package:rulegamemobile/widgets/shape.dart';

class Piece extends HookWidget {
  final BoardObject boardObject;

  Piece({required this.boardObject});

  @override
  Widget build(BuildContext context) {
    final boardStore = Provider.of<BoardStore>(context);
    final hasBeenDropped = boardObject.dropped != null;

    return Container(
      constraints: BoxConstraints.expand(),
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
                    feedback: Container(
                        width: 100,
                        height: 100,
                        child: Transform.translate(
                          offset: Offset(-75, -75),
                          child: Shape(
                            shape: boardObject.shape,
                            color: boardObject.color,
                          ),
                        )),
                    dragAnchorStrategy: pointerDragAnchorStrategy,
                    child: Shape(
                      shape: boardObject.shape,
                      color: boardObject.color,
                    ),
                  );
                },
              ),
            ),
            if (hasBeenDropped)
              Positioned.fill(
                child: SvgPicture.asset(
                  'assets/images/check.svg',
                  color: Color.fromRGBO(0, 128, 0, 1),
                ),
              ),
            if (!hasBeenDropped &&
                boardObject.buckets.isEmpty &&
                boardStore.feedbackSwitches != FeedbackSwitches.FREE)
              Positioned.fill(
                child: SvgPicture.asset('assets/images/close.svg'),
              ),
            if (boardStore.showGridMemoryOrder &&
                boardStore.getMoveNum(boardObject.id) > 0)
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
    );
  }
}
