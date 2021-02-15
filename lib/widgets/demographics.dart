import 'package:flutter/material.dart' hide Page;
import 'package:flutter_hooks/flutter_hooks.dart';

final genders = ['Male', 'Female', 'Other', 'NA|Prefer not to say'];
final native = ['Yes', 'No'];
final degrees = [
  'Less than high school',
  'High school diploma',
  'Some college, no degree',
  "Associate's degree",
  "Bachelor's degree",
  'PhD, law, or medical degree',
  'Prefer not to say',
];
final fun = [
  'Not fun at all',
  'Not that much',
  'Just so so',
  'Kind of fun',
  'Really fun',
];

class Demographics extends HookWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final selectedGender = useState<String>();
    final selectedNative = useState<String>();
    final selectedDegree = useState<String>();
    final selectedFun = useState<String>();

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Demographics',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            IntrinsicHeight(
              child: Column(
                children: [
                  Text('1. What is your gender?'),
                  ...genders.map(
                    (gender) => Expanded(
                      child: RadioListTile<String>(
                        title: Text(gender),
                        value: gender,
                        groupValue: selectedGender.value,
                        onChanged: (String value) {
                          selectedGender.value = value;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            IntrinsicHeight(
              child: Column(
                children: [
                  Text('2. Are you a native English speaker?'),
                  ...native.map(
                    (option) => Expanded(
                      child: RadioListTile<String>(
                        title: Text(option),
                        value: option,
                        groupValue: selectedNative.value,
                        onChanged: (String value) {
                          selectedNative.value = value;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (selectedNative.value == native[0])
              Text('2.5 Please indicate your native language or languages:'),
            if (selectedNative.value == native[0]) TextFormField(),
            Text(
                "3. What other languages do you speak? Please enter 'none' if just English."),
            TextFormField(),
            IntrinsicHeight(
              child: Column(
                children: [
                  Text(
                    '4. What is the highest degree or level of school you have completed. If currently enrolled, indicate highest degree received',
                  ),
                  ...degrees.map(
                    (option) => Expanded(
                      child: RadioListTile<String>(
                        title: Text(option),
                        value: option,
                        groupValue: selectedDegree.value,
                        onChanged: (String value) {
                          selectedDegree.value = value;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            IntrinsicHeight(
              child: Column(
                children: [
                  Text(
                    '5. How fun was this game?',
                  ),
                  ...fun.map(
                    (option) => Expanded(
                      child: RadioListTile<String>(
                        title: Text(option),
                        value: option,
                        groupValue: selectedFun.value,
                        onChanged: (String value) {
                          selectedFun.value = value;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
