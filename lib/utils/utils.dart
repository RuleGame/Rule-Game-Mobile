import 'package:flutter/material.dart';

void showErrorAlert(BuildContext context, Exception e) async {
  await showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('An Error Occurred'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(e.toString()),
              Text('Please restart the app. Or contact us.'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
}