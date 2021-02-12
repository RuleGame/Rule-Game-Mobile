import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rulegamemobile/mobx/board.dart';
import 'package:rulegamemobile/widgets/board.dart';

class Game extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<BoardStore>(context);

    final textStyle = DefaultTextStyle.of(context)
        .style
        .apply(fontSizeFactor: 2.0)
        .apply(fontWeightDelta: 2);

    return Column(
      children: [
        Observer(
          builder: (_) => Text(
            'Number of moves made: ${store.numMovesMade}',
            style: textStyle,
          ),
        ),
        Board(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Observer(
              builder: (_) => Text(
                'Board ${store.episodeNo + 1} of ${store.totalBoardsPredicted}',
                style: textStyle,
              ),
            ),
            Observer(
              builder: (_) => Text(
                'Points: ${store.totalRewardEarned}',
                style: textStyle,
              ),
            ),
          ],
        )
      ],
    );
  }
}
