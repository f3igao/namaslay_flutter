import 'dart:async';
import 'package:flutter/material.dart';

class WorkoutDisplay extends StatefulWidget {
  final List<dynamic> workoutPoses;
  WorkoutDisplay({this.workoutPoses});

  @override
  WorkoutDisplayState createState() => WorkoutDisplayState();
}

class WorkoutDisplayState extends State<WorkoutDisplay> {
  int poseCount;
  int currentIndex = 0;

  @override
  void initState() {
    _startWorkout(widget.workoutPoses);
    super.initState();
  }

  void _startWorkout(poses) {
    poseCount = poses.length;
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (currentIndex >= poseCount) {
        timer.cancel();
      } else {
        setState(() {
          currentIndex += 1;
          print(currentIndex);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          child: LinearProgressIndicator(
            value: currentIndex / poseCount,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: (MediaQuery.of(context).size.height) / 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              widget.workoutPoses[currentIndex]['imageUrl'],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            widget.workoutPoses[currentIndex]['name'],
            style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w600,
                color: Colors.black54),
          ),
        ),
      ],
    );
  }
}
