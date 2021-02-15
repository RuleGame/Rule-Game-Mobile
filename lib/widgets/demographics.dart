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

class InvalidText extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Please fill out this field.',
      style: TextStyle(color: Colors.red),
    );
  }
}

class RadioGroup extends HookWidget {
  final bool required;
  final String label;
  final List<String> values;
  final bool isInvalid;
  final void Function(String value) onChange;
  final String selected;

  RadioGroup({
    this.required,
    this.label,
    this.values,
    this.isInvalid,
    this.onChange,
    this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            children: [
              if (required)
                TextSpan(
                  text: ' *',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        if (isInvalid) InvalidText(),
        ...values.map(
          (option) => RadioListTile<String>(
            title: Text(option),
            value: option,
            groupValue: selected,
            onChanged: (String value) {
              onChange(value);
            },
          ),
        ),
      ],
    );
  }
}

class Demographics extends HookWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final selectedGender = useState<String>();
    final invalidGender = useState<bool>(false);
    final selectedNative = useState<String>();
    final invalidNative = useState<bool>(false);
    final selectedDegree = useState<String>();
    final invalidDegree = useState<bool>(false);
    final selectedFun = useState<String>();
    final invalidFun = useState<bool>(false);
    final textStyle = TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold);

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RadioGroup(
              label: '1. What is your gender?',
              required: true,
              values: genders,
              onChange: (value) {
                invalidGender.value = false;
                selectedGender.value = value;
              },
              isInvalid: invalidGender.value,
              selected: selectedGender.value,
            ),
            Divider(),
            RadioGroup(
              label: '2. Are you a native English speaker?',
              required: true,
              values: native,
              onChange: (value) {
                invalidNative.value = false;
                selectedNative.value = value;
              },
              isInvalid: invalidNative.value,
              selected: selectedNative.value,
            ),
            Divider(),
            if (selectedNative.value == native[0])
              Text(
                '2.5 Please indicate your native language or languages:',
                textAlign: TextAlign.center,
                style: textStyle,
              ),
            if (selectedNative.value == native[0]) TextFormField(),
            Divider(),
            Text(
              "3. What other languages do you speak? Please enter 'none' if just English.",
              textAlign: TextAlign.center,
              style: textStyle,
            ),
            TextFormField(),
            Divider(),
            RadioGroup(
              label:
                  '4. What is the highest degree or level of school you have completed. If currently enrolled, indicate highest degree received',
              required: true,
              values: degrees,
              onChange: (value) {
                invalidDegree.value = false;
                selectedDegree.value = value;
              },
              isInvalid: invalidDegree.value,
              selected: selectedDegree.value,
            ),
            Divider(),
            RadioGroup(
              label: '5. How fun was this game?',
              required: true,
              values: fun,
              onChange: (value) {
                invalidFun.value = false;
                selectedFun.value = value;
              },
              isInvalid: invalidFun.value,
              selected: selectedFun.value,
            ),
            Divider(),
            Text(
              '6. Comments',
              textAlign: TextAlign.center,
              style: textStyle,
            ),
            TextFormField(),
            ElevatedButton(
              onPressed: () {
                var invalid = false;
                if (selectedGender.value == null) {
                  invalidGender.value = true;
                  invalid = true;
                }
                if (selectedNative.value == null) {
                  invalidNative.value = true;
                  invalid = true;
                }
                if (selectedDegree.value == null) {
                  invalidDegree.value = true;
                  invalid = true;
                }
                if (selectedFun.value == null) {
                  invalidFun.value = true;
                  invalid = true;
                }
                // Validate returns true if the form is valid, otherwise false.
                if (_formKey.currentState.validate() && !invalid) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
