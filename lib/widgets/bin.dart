import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rulegamemobile/mobx/board.dart';
import 'package:rulegamemobile/widgets/shape.dart';

class Bin extends HookWidget {
  final int bucketPosition;

  Bin({this.bucketPosition});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<BoardStore>(context);

    return Container(
      width: 25,
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Observer(
        builder: (_) => Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: store
              .binBoardObjects(bucketPosition)
              .map(
                (boardObject) =>
                    Shape(shape: boardObject.shape, color: boardObject.color),
              )
              .toList(),
        ),
      ),
    );
  }
}
