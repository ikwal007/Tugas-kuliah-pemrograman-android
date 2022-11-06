import 'package:flutter/material.dart';
// import 'package:flutter_app/column_widget.dart';
// import 'package:flutter_app/row_widget.dart';
import 'package:flutter_app/ui/produk_form.dart';
// import 'package:flutter_app/helo_world.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Belajar Flutter',
      home: ProdukForm(),
    );
  }
}
