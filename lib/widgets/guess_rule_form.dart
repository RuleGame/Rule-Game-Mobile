import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:rulegamemobile/mobx/board.dart';
import 'package:rulegamemobile/utils/hooks.dart';

class GuessRuleForm extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<BoardStore>(context);

    final controller = useTextEditingController();
    final disableButtons = useState(true);
    useMount(() {
      controller.text = 'Saved guess';
      disableButtons.value = controller.text.isEmpty;
      return null;
    });

    return Column(
      children: [
        TextField(
          controller: controller,
          onChanged: (value) {
            disableButtons.value = value.isEmpty;
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Guess the rule',
          ),
        ),
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
                                  : () {
                                      final ratingNum = i + 1;
                                      store.guess(controller.text, ratingNum);
                                    },
                              // onPressed: null,
                              child: Text(
                                '${i + 1}',
                                style: DefaultTextStyle.of(context)
                                    .style
                                    .apply(fontSizeFactor: 1.5)
                                    .apply(fontWeightDelta: 2),
                              ),
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                side: BorderSide(width: 4),
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
