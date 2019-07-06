import 'package:flutter/material.dart';
import 'package:namaslay_flutter/model/poses_data.dart';
import 'package:namaslay_flutter/shared/workout_display.dart';

class WorkoutDialog extends StatefulWidget {
  final List<dynamic> sequence;
  WorkoutDialog({this.sequence});

  @override
  WorkoutDialogState createState() => WorkoutDialogState();
}

class WorkoutDialogState extends State<WorkoutDialog> {
  List<dynamic> workoutPoses = [];

  @override
  void initState() {
    _getWorkoutPoses(widget.sequence);
    super.initState();
  }

  void _getWorkoutPoses(sequence) {
    sequence.forEach((poseId) {
      workoutPoses.add(poses.firstWhere((pose) => pose['id'] == poseId));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        WorkoutDisplay(workoutPoses: workoutPoses),
        // cancel icon
        Positioned(
            left: 0.0,
            top: 0.0,
            child: SafeArea(
                child: IconButton(
              icon: Icon(Icons.close, color: Colors.black54),
              onPressed: () {
                Navigator.pop(context);
              },
            ))),
      ],
    ));
  }
}