import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rulegamemobile/mobx/board.dart';
import 'package:rulegamemobile/utils/models.dart';
import 'package:rulegamemobile/widgets/shape.dart';

class BinObject extends HookWidget {
  final BoardObject boardObject;

  BinObject({this.boardObject});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<BoardStore>(context);

    return GestureDetector(
      child: Observer(
        builder: (_) => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (store.showStackMemoryOrder)
              Container(
                padding: EdgeInsets.all(0.5),
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Text('${store.getMoveNum(boardObject.id)}'),
              ),
            Container(
              width: 25,
              child: Shape(shape: boardObject.shape, color: boardObject.color),
            ),
          ],
        ),
      ),
    );
  }
}
