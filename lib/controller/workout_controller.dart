import 'package:flutter/material.dart';

class WorkoutControl extends StatelessWidget {
  final Function playWorkout;
  final String text;

  WorkoutControl({this.playWorkout, this.text});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: FloatingActionButton.extended(
          onPressed: () {
            playWorkout();
          },
          icon: text == 'PLAY' ? Icon(Icons.play_arrow) : Icon(Icons.pause),
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
