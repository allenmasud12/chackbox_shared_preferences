import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool isChecked = false;
  bool isChecked1 = false;

  @override
  void initState() {
    super.initState();
    loadCheckboxState();
  }

  Future<void> loadCheckboxState() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isChecked = prefs.getBool('isChecked') ?? false;
      isChecked1 = prefs.getBool('isChecked1') ?? false;
    });
  }

  Future<void> saveCheckboxState(bool value, String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              checkColor: Colors.white,
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                  saveCheckboxState(isChecked, 'isChecked');
                });
              },
            ),
            Text('data1'),
          ],
        ),
        Row(
          children: [
            Checkbox(
              checkColor: Colors.white,
              value: isChecked1,
              onChanged: (bool? value) {
                setState(() {
                  isChecked1 = value!;
                  saveCheckboxState(isChecked1, 'isChecked1');
                });
              },
            ),
            Text('data2'),
          ],
        ),

        Column(
          children: [
            if(isChecked)
          Text('this is data1'),
            if(isChecked1)
          Text('this is data2'),
        ],)
      ],
    );
  }
}
