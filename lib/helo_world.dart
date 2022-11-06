import 'package:flutter/material.dart';

class HeloWorld extends StatelessWidget {
  const HeloWorld({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Belajar Flutter"),
      ),
      body: const Center(
        child: Text('helo world'),
      ),
    );
  }
}