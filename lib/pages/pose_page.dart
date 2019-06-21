import 'package:flutter/material.dart';

class PosePage extends StatelessWidget {
  final String poseName;
  PosePage({this.poseName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(poseName),
      ),
      body: Container(),
    );
  }
}