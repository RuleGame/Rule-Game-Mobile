import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rulegamemobile/shape.dart';

class Piece extends HookWidget {
  final String shape;

  final String color;

  Piece({this.shape, this.color});

  @override
  Widget build(BuildContext context) {
    final shapeWidget = Shape(shape: shape, color: color);

    return Container(
      child: Draggable(
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
