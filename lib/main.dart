// @dart=2.9
import 'package:flutter/material.dart' hide Page;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rulegamemobile/mobx/board.dart';
import 'package:rulegamemobile/utils/page.dart';
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
          // TODO: Handle this case.
          break;
        case Page.DEMOGRAPHICS:
          // TODO: Handle this case.
          break;
        case Page.DEBRIEFING:
          // TODO: Handle this case.
          break;
      }
      return Scaffold(
        body: Center(
          child: Text(
              'Error: This screen page is missing. Please restart the app. Or contact us.'),
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
          child: Text('Start'),
          onPressed: () {
            boardStore.goToPage(Page.LOADING_TRIALS);
            boardStore.loadTrials();
          },
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
