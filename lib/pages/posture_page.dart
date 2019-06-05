import 'package:flutter/material.dart';

class PosturePage extends StatelessWidget {
  final String postureName;
  PosturePage(this.postureName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(postureName),
      ),
      body: Container(),
    );
  }
}