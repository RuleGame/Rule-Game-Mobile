import 'package:flutter/material.dart';
import 'package:rulegamemobile/main.dart';

enum Page {
  LOADING_TRIALS,
  CONSENT,
  INTRODUCTION,
  TRIALS,
  DEMOGRAPHICS_INSTRUCTIONS,
  DEMOGRAPHICS,
  DEBRIEFING,
}

const PAGE_ORDER = [
  Page.CONSENT,
  Page.INTRODUCTION,
  Page.LOADING_TRIALS,
  Page.TRIALS,
  Page.DEMOGRAPHICS_INSTRUCTIONS,
  Page.DEMOGRAPHICS,
  Page.DEBRIEFING,
];

final Map<Page, Widget> PAGE_TO_WIDGET = {
  Page.INTRODUCTION: IntroductionPage(),
  Page.LOADING_TRIALS: LoadingPage(),
  Page.TRIALS: TrialsPage(),
};
