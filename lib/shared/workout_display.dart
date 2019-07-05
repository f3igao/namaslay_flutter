import 'dart:async';
import 'package:flutter/material.dart';
import 'package:namaslay_flutter/model/poses_data.dart';

class WorkoutDisplay extends StatefulWidget {
  final List<dynamic> sequence;
  WorkoutDisplay({this.sequence});

  @override
  WorkoutDisplayState createState() => WorkoutDisplayState();
}

class WorkoutDisplayState extends State<WorkoutDisplay> {
  int currentIndex = 0;
  int poseCount = 0;
  List<dynamic> workoutPoses = [];

  void _buildWorkoutPoses() {
    widget.sequence.forEach((poseId) {
      workoutPoses.add(poses.firstWhere((pose) => pose['id'] == poseId));
    });
    poseCount = widget.sequence.length;
  }

  // void _calculateProgress() {
  //   progress = currentIndex / poseCount;
  //   print(progress);
  // }

  void _startWorkout() {
    Timer.periodic(Duration(seconds: 2), (timer) {
      if (currentIndex >= poseCount) {
        timer.cancel();
      } else {
        // setState(() {
          currentIndex += 1;
          print(currentIndex);
          // _calculateProgress();
        // });
      }
    });
  }

  

  @override
  Widget build(BuildContext context) {
    _buildWorkoutPoses();
    // count down 3 2 1
    // start workout

    _startWorkout();
    
    return Scaffold(
        body: Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              // child: WorkoutProgressIndicator(),
              child: LinearProgressIndicator(
                value: currentIndex / poseCount,
              ),
            ),
            // FloatingActionButton(
            //   child: Icon(Icons.add),
            //   onPressed: () {
            //     setState(() {
            //       currentIndex += 1;
            //       _calculateProgress();
            //     });
            //   },
            // ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: (MediaQuery.of(context).size.height) / 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                // child: Image.network(
                //   workoutPoses[currentIndex]['imageUrl'],
                // ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                workoutPoses[currentIndex]['name'],
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54),
              ),
            ),
          ],
        ),
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
