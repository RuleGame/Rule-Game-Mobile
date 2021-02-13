import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rulegamemobile/mobx/board.dart';
import 'package:rulegamemobile/utils/hooks.dart';
import 'package:rulegamemobile/utils/models.dart' hide Board;
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
    final controller = useTextEditingController();
    useMount(() {
      controller.text = 'Saved guess';
      return null;
    });

    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Observer(
        builder: (_) => Column(
          children: [
            Text(
              'Number of moves made: ${store.numMovesMade}',
              style: textStyle,
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
            ),
            if (store.finishCode == FinishCode.FINISH)
              Text('Board succesfully cleared!'),
            if (store.finishCode == FinishCode.STALEMATE ||
                store.finishCode == FinishCode.LOST)
              Text('No more moves left!'),
            if (store.isGameCompleted) GuessRuleForm(),
          ],
        ),
      ),
    );
  }
}
