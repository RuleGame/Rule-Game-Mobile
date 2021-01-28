import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rulegamemobile/utils/models.dart';
import 'package:rulegamemobile/widgets/shape.dart';

class Piece extends HookWidget {
  final BoardObject boardObject;

  Piece({this.boardObject});

  @override
  Widget build(BuildContext context) {
    final shapeWidget =
        Shape(shape: boardObject.shape, color: boardObject.color);

    return Container(
      child: Draggable(
        data: boardObject,
        child: shapeWidget,
        feedback: Container(
          child: shapeWidget,
        ),
        dragAnchor: DragAnchor.pointer,
      ),
      constraints: BoxConstraints.expand(),
    );
  }
}
