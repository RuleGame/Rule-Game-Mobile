import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rulegamemobile/mobx/board.dart';
import 'package:rulegamemobile/utils/models.dart' hide Board;
import 'package:rulegamemobile/widgets/bin.dart';
import 'package:rulegamemobile/widgets/board.dart';
import 'package:rulegamemobile/widgets/guess_rule_form.dart';

class Game extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<BoardStore>(context);

    final textStyle = DefaultTextStyle.of(context)
        .style
        .apply(fontSizeFactor: 2.0)
        .apply(fontWeightDelta: 2);

    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Observer(
        builder: (_) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Number of moves made: ${store.numMovesMade}',
              style: textStyle,
            ),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (store.displayBucketBins)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: Bin(bucketPosition: BucketPosition.TL),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: Bin(bucketPosition: BucketPosition.BL),
                          ),
                        ),
                      ],
                    ),
                  Expanded(child: Board()),
                  if (store.displayBucketBins)
                    Column(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: Bin(bucketPosition: BucketPosition.TR),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: Bin(bucketPosition: BucketPosition.BR),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
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
            ),
            if (store.finishCode == FinishCode.FINISH)
              Text(
                'Board succesfully cleared!',
                style: textStyle.apply(color: Colors.green),
              ),
            if (store.finishCode == FinishCode.STALEMATE ||
                store.finishCode == FinishCode.LOST)
              Text(
                'No more moves left!',
                style: textStyle.apply(color: Colors.red),
              ),
            if (store.isGameCompleted) GuessRuleForm(),
          ],
        ),
      ),
    );
  }
}
