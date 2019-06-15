import 'package:flutter/material.dart';
import 'app.dart';

void main() => runApp(Namaslay());

class Namaslay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowMaterialGrid: true,
      // showSemanticsDebugger: true,
      debugShowCheckedModeBanner: false,
      title: 'Namaslay',
      home: AppHome(),
    );
  }
}