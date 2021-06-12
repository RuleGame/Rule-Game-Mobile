// @dart=2.9
import 'package:flutter/material.dart' hide Page;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rulegamemobile/mobx/board.dart';
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
          // TODO: Handle this case.
          break;
        case Page.INTRODUCTION:
          return IntroductionPage();
        case Page.TRIALS:
          return TrialsPage();
        case Page.DEMOGRAPHICS_INSTRUCTIONS:
          return DemographicsInstructionsPage();
        case Page.DEMOGRAPHICS:
          return DemographicsPage();
          break;
        case Page.DEBRIEFING:
          // TODO: Handle this case.
          break;
      }
      return Scaffold(
        body: Center(
          child: Text(
              'Error: This screen page (${boardStore.page}) is missing. Please restart the app. Or contact us.'),
        ),
      );
    });
  }
}

class IntroductionPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final boardStore = Provider.of<BoardStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            boardStore.goToPage(Page.LOADING_TRIALS);
            boardStore.loadTrials();
          },
          child: Text('Start'),
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
            child: Text('Next'),
            onPressed: () {
              boardStore.goToPage(Page.DEMOGRAPHICS);
            },
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
        child: Demographics(),
        padding: EdgeInsets.all(10),
      ),
    );
  }
}
