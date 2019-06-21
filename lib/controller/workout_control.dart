import 'package:flutter/material.dart';

class WorkoutControl extends StatelessWidget {
  final Function playWorkout;
  String text = 'PLAY';
  IconData icon = Icons.play_arrow;

  WorkoutControl({this.playWorkout});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: FloatingActionButton.extended(
          onPressed: () {
            playWorkout();
            text = 'PAUSE';
            icon = Icons.pause;
          },
          icon: Icon(icon),
          label: Text(
            text,
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        top: 220.0,
        left: 130.0,
        width: 150.0,
        height: 60.0);
  }
}
