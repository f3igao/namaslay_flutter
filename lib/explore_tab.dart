import 'package:flutter/material.dart';

class ExploreTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Explore'),
          ),
          // body: Text('Explore')
        ),
    );
  }
}
