import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:rulegamemobile/constants/constants.dart';
import 'package:rulegamemobile/mobx/board.dart';
import 'package:rulegamemobile/utils/hooks.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GuessRuleForm extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<BoardStore>(context);

    final controller = useTextEditingController();
    final disableButtons = useState(true);

    final lastGuess = useSharedPref<String>(PREF_KEY.LAST_GUESS);
    final lastGuessSeriesNo = useSharedPref<int>(PREF_KEY.LAST_GUESS_SERIES_NO);
    final lastGuessPlayerId =
        useSharedPref<String>(PREF_KEY.LAST_GUESS_PLAYER_ID);
    final lastGuessExp = useSharedPref<String>(PREF_KEY.LAST_GUESS_EXP);
    final isPrevSeriesRuleGuessSaved = store.playerId == lastGuessPlayerId &&
        store.exp == lastGuessExp &&
        store.seriesNo == lastGuessSeriesNo &&
        lastGuess != null;

    controller.addListener(() {
      disableButtons.value = controller.text.isEmpty;
    });

    return Column(
      children: [
        Row(children: [
          Expanded(
            child: TextField(
              // Setting maxLines to null dynamically increases the height of
              // the TextField
              maxLines: null,
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Guess the rule',
              ),
            ),
          ),
          if (isPrevSeriesRuleGuessSaved)
            Container(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: ClipOval(
                child: Material(
                  color: Colors.blue, // button color
                  child: InkWell(
                    splashColor: Colors.red,
                    onTap: () {
                      controller.text = lastGuess ?? '';
                      controller.selection = TextSelection.fromPosition(
                          TextPosition(offset: controller.text.length));
                    }, // inkwell color
                    child: SizedBox(
                        width: 56, height: 56, child: Icon(Icons.copy)),
                  ),
                ),
              ),
            ),
        ]),
        Opacity(
          opacity: disableButtons.value ? 0.25 : 1,
          child: Column(
            children: [
              Text(
                'How sure are you?',
                style: DefaultTextStyle.of(context)
                    .style
                    .apply(fontSizeFactor: 1.5)
                    .apply(fontWeightDelta: 2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Just\nguessing'),
                  Expanded(
                    child: Row(
                      children: List.generate(
                        5,
                        (i) => Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 1, right: 1),
                            child: OutlinedButton(
                              // enabled: false,
                              onPressed: disableButtons.value
                                  ? null
                                  : () async {
                                      final ratingNum = i + 1;
                                      final guess = controller.text;
                                      // Prompt a dialog to confirm the guess
                                      // and rating
                                      await showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SimpleDialog(
                                            title: Text(
                                              'Your Rating: $ratingNum\nYour Guess: $guess\n',
                                              textAlign: TextAlign.center,
                                            ),
                                            children: <Widget>[
                                              SimpleDialogOption(
                                                onPressed: () async {
                                                  await store.guess(
                                                      guess, ratingNum);
                                                  final prefs =
                                                      await SharedPreferences
                                                          .getInstance();
                                                  await Future.wait(
                                                    [
                                                      prefs.setString(
                                                        PREF_KEY.LAST_GUESS,
                                                        guess,
                                                      ),
                                                      prefs.setString(
                                                        PREF_KEY.LAST_GUESS_EXP,
                                                        store.exp,
                                                      ),
                                                      prefs.setString(
                                                        PREF_KEY
                                                            .LAST_GUESS_PLAYER_ID,
                                                        store.playerId,
                                                      ),
                                                      prefs.setInt(
                                                        PREF_KEY
                                                            .LAST_GUESS_SERIES_NO,
                                                        store.seriesNo,
                                                      ),
                                                    ],
                                                  );
                                                  Navigator.pop(context);
                                                },
                                                child: Row(children: <Widget>[
                                                  Icon(Icons.check),
                                                  Text('Submit')
                                                ]),
                                              ),
                                              SimpleDialogOption(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Row(children: <Widget>[
                                                  Icon(Icons.edit),
                                                  Text('Edit')
                                                ]),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                side: BorderSide(width: 4),
                              ),
                              // onPressed: null,
                              child: Text(
                                '${i + 1}',
                                style: DefaultTextStyle.of(context)
                                    .style
                                    .apply(fontSizeFactor: 1.5)
                                    .apply(fontWeightDelta: 2),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text('Completely\nsure'),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
