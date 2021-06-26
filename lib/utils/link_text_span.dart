import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide Page;
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkTextSpan extends TextSpan {
  @override
  final String text;
  final BuildContext context;
  final String link;
  final String? copyLink;

  LinkTextSpan({
    required this.context,
    required this.text,
    required this.link,
    this.copyLink,
  }) : super(
          text: text,
          style: TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () async {
              final mailUrl = link;
              if (await canLaunch(mailUrl)) {
                await launch(mailUrl);
              } else {
                await Clipboard.setData(
                  ClipboardData(text: copyLink ?? link),
                );
                final snackBar = SnackBar(content: Text('Copied'));

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
        );
}
