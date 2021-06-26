import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide Page;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rulegamemobile/mobx/board.dart';
import 'package:rulegamemobile/utils/email_text_span.dart';
import 'package:rulegamemobile/utils/page.dart';
import 'package:rulegamemobile/widgets/demographics.dart';
import 'package:rulegamemobile/widgets/game.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<BoardStore>(
      create: (_) => BoardStore(),
      child: MaterialApp(
        title: 'Rule Game',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Pages(),
      ),
    );
  }
}

class Pages extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final boardStore = Provider.of<BoardStore>(context);

    return Observer(builder: (_) {
      switch (boardStore.page) {
        case Page.LOADING_TRIALS:
          return LoadingPage();
        case Page.CONSENT:
          return ConsentPage();
        case Page.INTRODUCTION:
          return IntroductionPage();
        case Page.TRIALS:
          return TrialsPage();
        case Page.DEMOGRAPHICS_INSTRUCTIONS:
          return DemographicsInstructionsPage();
        case Page.DEMOGRAPHICS:
          return DemographicsPage();
        case Page.DEBRIEFING:
          // TODO: Handle this case.
          // TODO: Include play again button and regenerate player id
          return DebriefingPage();
      }
    });
  }
}

class IntroductionPage extends HookWidget {
  final CarouselController buttonCarouselController = CarouselController();

  final items = [
    Image.asset('assets/instructions/instructions_final.001.jpeg'),
    Image.asset('assets/instructions/instructions_final.002.jpeg'),
    Image.asset('assets/instructions/instructions_final.003.jpeg'),
    Image.asset('assets/instructions/instructions_final.004M.jpeg'),
    Image.asset('assets/instructions/instructions_final.005.jpeg'),
    Image.asset('assets/instructions/instructions_final.006.jpeg'),
    Image.asset('assets/instructions/instructions_final.007M.jpeg'),
    Image.asset('assets/instructions/instructions_final.008.jpeg'),
    Image.asset('assets/instructions/instructions_final.009.jpeg'),
    Image.asset('assets/instructions/instructions_final.010.jpeg'),
    Image.asset('assets/instructions/instructions_final.011.jpeg'),
    Image.asset('assets/instructions/instructions_final.012.jpeg'),
    Image.asset('assets/instructions/instructions_final.013.jpeg'),
    Image.asset('assets/instructions/instructions_final.014.jpeg'),
    Image.asset('assets/instructions/instructions_final.015.jpeg'),
    Image.asset('assets/instructions/instructions_final.016.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    final boardStore = Provider.of<BoardStore>(context);
    final currPage = useState(1);
    final reachedEnd = useState(false);
    final expController = useTextEditingController(text: boardStore.exp);
    final isResetChecked = useState(false);

    useEffect(() {
      if (currPage.value == items.length) {
        reachedEnd.value = true;
      }
    }, [currPage.value]);

    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(),
            Text('Page ${currPage.value} of ${items.length}'),
            CarouselSlider(
              items: items,
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                aspectRatio: 1,
                autoPlay: false,
                enlargeCenterPage: true,
                onPageChanged: (index, _) => currPage.value = index + 1,
                enableInfiniteScroll: false,
                viewportFraction: 1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: currPage.value > 1
                      ? () {
                          buttonCarouselController.previousPage();
                        }
                      : null,
                  child: Text('Prev'),
                ),
                ElevatedButton(
                  onPressed: currPage.value < items.length
                      ? () {
                          buttonCarouselController.nextPage();
                        }
                      : null,
                  child: Text('Next'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: reachedEnd.value
                  ? () {
                      boardStore.setExp(expController.text);
                      boardStore.goToPage(Page.LOADING_TRIALS);
                      boardStore.loadTrials();
                    }
                  : null,
              child: Text('Start'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: FractionallySizedBox(
                    widthFactor: 0.5,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Experiment Name',
                      ),
                      controller: expController,
                    ),
                  ),
                ),
                Text('Reset'),
                Checkbox(
                  checkColor: Colors.white,
                  value: isResetChecked.value,
                  onChanged: (bool? value) {
                    isResetChecked.value = value ?? false;
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: Text('Loading...'),
      ),
    );
  }
}

class TrialsPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rule Game'),
      ),
      body: Game(),
    );
  }
}

class DemographicsInstructionsPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final boardStore = Provider.of<BoardStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Rule Game'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Thank you! We'll now ask a few questions, and you'll be done!",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            onPressed: () {
              boardStore.goToPage(Page.DEMOGRAPHICS);
            },
            child: Text('Next'),
          ),
        ],
      ),
    );
  }
}

class DemographicsPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demographics'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Demographics(),
      ),
    );
  }
}

class ConsentPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = TextStyle(color: Colors.black);
    final isChecked = useState(false);
    final boardStore = Provider.of<BoardStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Consent'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'The task you are about to do is sponsored by ',
                  style: defaultTextStyle,
                  children: <TextSpan>[
                    TextSpan(
                        text: 'University of Wisconsin-Madison',
                        style: defaultTextStyle
                            .merge(TextStyle(fontWeight: FontWeight.bold))),
                  ],
                ),
              ),
              Divider(),
              Text(
                '. It is part of a protocol titled “Human and Machine '
                'Learning: The Search for Anomalies”.'
                'The purpose of this work is to compare reasoning '
                'biases in human and machine learners'
                'by testing what reasoning problems are relatively '
                'easier or more difficult for people, and'
                'for machines.',
                style: defaultTextStyle,
                textAlign: TextAlign.center,
              ),
              Divider(),
              Text(
                'This task has no direct benefits. We do not anticipate any psychosocial risks. There is a '
                'risk of a confidentiality breach. Participants may become fatigued or frustrated due to '
                'the length of the study. The responses you submit as part of this task will be stored on a '
                'secure server and accessible only to researchers who have been approved by UW-Madison. '
                'Processed data with all identifiers removed could be used for future research studies or '
                'distributed to another investigator for future research studies without additional informed '
                'consent from the subject or the legally authorized representative.',
                style: defaultTextStyle,
                textAlign: TextAlign.center,
              ),
              Divider(),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'If you have any questions or concerns about this task '
                      'please contact the principal investigator: Prof. Vicki Bier at ',
                  style: defaultTextStyle,
                  children: <TextSpan>[
                    EmailTextSpan(
                      context: context,
                      email: 'vicki.bier@wisc.edu',
                    ),
                  ],
                ),
              ),
              Divider(),
              Text(
                'If you are not satisfied with response of the research team, have more questions, or want to talk '
                'with someone about your rights as a research participant, you should contact University of Wisconsin’s '
                'Education Research and Social & Behavioral Science IRB Office at 608-263-2320.',
                style: defaultTextStyle,
                textAlign: TextAlign.center,
              ),
              Divider(),
              Text(
                  'By clicking this box, I consent to participate in this task.'),
              Checkbox(
                checkColor: Colors.white,
                value: isChecked.value,
                onChanged: (bool? value) {
                  isChecked.value = value ?? false;
                },
              ),
              ElevatedButton(
                onPressed: isChecked.value
                    ? () {
                        boardStore.goToPage(Page.INTRODUCTION);
                      }
                    : null,
                child: Text('Start'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DebriefingPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final boardStore = Provider.of<BoardStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Debriefing'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              'Thank you for participating!',
              textAlign: TextAlign.center,
            ),
            Divider(),
            Text(
              "We're using this task to better understand what kinds of "
              'rules are easy and hard for people compared to machine '
              'learning algorithms.',
              textAlign: TextAlign.center,
            ),
            Divider(),
            ElevatedButton(
              onPressed: () async {
                await boardStore.loadPlayerId(regenerate: true);
                boardStore.goToPage(Page.INTRODUCTION);
              },
              // style: ButtonStyle(backgroundColor: Colors.orange),
              child: Text('Retry the game from start'),
            )
          ],
        ),
      ),
    );
  }
}
