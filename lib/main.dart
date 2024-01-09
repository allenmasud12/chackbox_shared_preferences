import 'package:flutter/material.dart';

import 'home_page.dart';

void main() => runApp(const CheckboxExampleApp());

class CheckboxExampleApp extends StatelessWidget {
  const CheckboxExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Checkbox Sample')),
        body: const Center(
          child: CheckboxExample(),
        ),
      ),
    );
  }
}


