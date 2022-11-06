import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Column'),
      ),
      body: Column(children: const [
        Text('kolom 1'),
        Text('kolom 2'),
        Text('kolom 3'),
        Text('kolom 4')
      ]),
    );
  }
}
