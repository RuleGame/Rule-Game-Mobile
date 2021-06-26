import 'package:dotted_border/dotted_border.dart';
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
    final binPadding = 0.5;

    final textStyle = DefaultTextStyle.of(context)
        .style
        .apply(fontSizeFactor: 2.0)
        .apply(fontWeightDelta: 2);

    final bonusActivated = useState(false);

    useEffect(() {
      bonusActivated.value = false;
    }, [store.episodeNo]);

    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Observer(
        builder: (_) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Rule ${store.ruleNum}' +
                  (store.isInBonus ? ' (Bonus Round)' : ''),
              style: textStyle,
            ),
            Text(
              'Number of moves made: ${store.numMovesMade}',
              textAlign: TextAlign.center,
              style: textStyle,
            ),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (store.displayBucketBins)
                    Container(
                      // Forces IntrinsicHeight to size based on Board child only
                      height: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(binPadding),
                              child: Bin(bucketPosition: BucketPosition.TL),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(binPadding),
                              child: Bin(bucketPosition: BucketPosition.BL),
                            ),
                          ),
                        ],
                      ),
                    ),
                  Expanded(child: Board()),
                  if (store.displayBucketBins)
                    Container(
                      // Forces IntrinsicHeight to size based on Board child only
                      height: 0,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(binPadding),
                              child: Bin(bucketPosition: BucketPosition.TR),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(binPadding),
                              child: Bin(bucketPosition: BucketPosition.BR),
                            ),
                          ),
                        ],
                      ),
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
            Divider(),
            if (store.canActivateBonus &&
                store.isGameCompleted &&
                !store.isInBonus)
              bonusActivated.value
                  ? DottedBorder(
                      color: Colors.black,
                      radius: Radius.circular(12),
                      padding: EdgeInsets.all(6),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          child: Text(
                            'Bonus activated next round!',
                            style: textStyle,
                          ),
                        ),
                      ),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        bonusActivated.value = true;
                        store.activateBonus();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red),
                        ),
                      ),
                      // style: ButtonStyle(backgroundColor: Colors.orange),
                      child: Observer(
                        builder: (_) => Text(
                          'Think you got it?\nActivate bonus rounds!',
                          style: textStyle.apply(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
            Divider(),
            if (store.isGameCompleted && !store.isInBonus) GuessRuleForm(),
            if (store.isGameCompleted && store.isInBonus)
              Column(
                children: [
                  store.finishCode == FinishCode.FINISH
                      ? Text(
                          'Board succesfully cleared!',
                          textAlign: TextAlign.center,
                          style: textStyle.apply(color: Colors.green),
                        )
                      : store.finishCode == FinishCode.STALEMATE ||
                              store.finishCode == FinishCode.LOST
                          ? Text(
                              'No more moves left!',
                              style: textStyle.apply(color: Colors.red),
                            )
                          : Container(),
                  ElevatedButton(
                    onPressed: () => store.loadNextBonus(),
                    child: Observer(
                      builder: (_) => Text(
                        store.hasMoreBonusRounds
                            ? 'Next Bonus Round'
                            : store.finishCode == FinishCode.LOST
                                ? 'Next Rule (Bonus Lost)'
                                : 'Next Rule (Bonus Completed)',
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
