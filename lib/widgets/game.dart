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
    final boardStore = Provider.of<BoardStore>(context);
    final binPadding = 0.5;

    final textStyle = DefaultTextStyle.of(context)
        .style
        .apply(fontSizeFactor: 2.0)
        .apply(fontWeightDelta: 2);

    final bonusActivated = useState(false);

    useEffect(() {
      bonusActivated.value = false;
    }, [boardStore.episodeNo]);

    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Observer(
        builder: (_) {
          final ruleNum = boardStore.ruleNum;
          final isInBonus = boardStore.isInBonus;
          final numMovesMade = boardStore.numMovesMade;
          final displayBucketBins = boardStore.displayBucketBins;
          final episodeNo = boardStore.episodeNo;
          final totalRewardEarned = boardStore.totalRewardEarned;
          final totalBoardsPredicted = boardStore.totalBoardsPredicted;
          final canActivateBonus = boardStore.canActivateBonus;
          final isGameCompleted = boardStore.isGameCompleted;
          final finishCode = boardStore.finishCode;
          final hasMoreBonusRounds = boardStore.hasMoreBonusRounds;

          return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Rule $ruleNum' +
                  (isInBonus ? ' (Bonus Round)' : ''),
              style: textStyle,
            ),
            Text(
              'Number of moves made: $numMovesMade',
              textAlign: TextAlign.center,
              style: textStyle,
            ),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (displayBucketBins)
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
                  if (displayBucketBins)
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
                Text(
                  'Board ${episodeNo + 1} of $totalBoardsPredicted',
                  style: textStyle,
                ),
                Text(
                  'Points: $totalRewardEarned',
                  style: textStyle,
                ),
              ],
            ),
            Divider(),
            if (canActivateBonus &&
                isGameCompleted &&
                !isInBonus)
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
                        boardStore.activateBonus();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red),
                        ),
                      ),
                      // style: ButtonStyle(backgroundColor: Colors.orange),
                      child: Text(
                        'Think you got it?\nActivate bonus rounds!',
                        style: textStyle.apply(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
            Divider(),
            if (isGameCompleted && !isInBonus) GuessRuleForm(),
            if (isGameCompleted && isInBonus)
              Column(
                children: [
                  finishCode == FinishCode.FINISH
                      ? Text(
                          'Board succesfully cleared!',
                          textAlign: TextAlign.center,
                          style: textStyle.apply(color: Colors.green),
                        )
                      : finishCode == FinishCode.STALEMATE ||
                              finishCode == FinishCode.LOST
                          ? Text(
                              'No more moves left!',
                              style: textStyle.apply(color: Colors.red),
                            )
                          : Container(),
                  ElevatedButton(
                    onPressed: () => boardStore.loadNextBonus(),
                    child: Text(
                      hasMoreBonusRounds
                          ? 'Next Bonus Round'
                          : finishCode == FinishCode.LOST
                              ? 'Next Rule (Bonus Lost)'
                              : 'Next Rule (Bonus Completed)',
                    ),
                  ),
                ],
              ),
          ],
        );
        },
      ),
    );
  }
}
