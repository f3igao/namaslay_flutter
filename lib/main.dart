import 'package:flutter/material.dart';
import 'app.dart';
import 'data/poses_data.dart';
import 'data/workouts_data.dart';

void main() => runApp(Namaslay());

class Namaslay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    fetchPosesData();
    fetchWorkoutsData();

    return MaterialApp(
      // debugShowMaterialGrid: true,
      // showSemanticsDebugger: true,
      debugShowCheckedModeBanner: false,
      title: 'Namaslay',
      home: AppHome(),
    );
  }
}
