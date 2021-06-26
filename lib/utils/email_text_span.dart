import 'package:flutter/material.dart' hide Page;
import 'package:rulegamemobile/utils/link_text_span.dart';

class EmailTextSpan extends LinkTextSpan {
  @override
  final BuildContext context;
  final String email;

  EmailTextSpan({required this.context, required this.email})
      : super(
          context: context,
          text: email,
          link: 'mailto:$email',
          copyLink: email,
        );
}
