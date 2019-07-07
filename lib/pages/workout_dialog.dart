import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WorkoutDialog extends StatefulWidget {
  final List<dynamic> workoutPoses;
  WorkoutDialog({this.workoutPoses});

  @override
  WorkoutDialogState createState() => WorkoutDialogState();
}

class WorkoutDialogState extends State<WorkoutDialog> {
  int poseCount;
  int currentIndex = 0;
  Timer workoutTimer;

  @override
  void initState() {
    // _startWorkout();
    poseCount = widget.workoutPoses.length;
    workoutTimer = _startWorkoutTimer();
    super.initState();
  }

  Timer _startWorkoutTimer() {
    return Timer.periodic(Duration(seconds: 2), (timer) {
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

  void _stopWorkout() {
    workoutTimer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(
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
                child: Image(
                    image: CachedNetworkImageProvider(
                  widget.workoutPoses[currentIndex]['imageUrl'],
                )),
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
        ),
        // cancel icon
        Positioned(
            left: 0.0,
            top: 0.0,
            child: SafeArea(
                child: IconButton(
              icon: Icon(Icons.close, color: Colors.black54),
              onPressed: () {
                _stopWorkout();
                Navigator.pop(context);
              },
            ))),
      ],
    ));
  }
}

// class WorkoutDialog extends StatefulWidget {
//   final List<dynamic> sequence;
//   WorkoutDialog({this.sequence});

//   @override
//   WorkoutDialogState createState() => WorkoutDialogState();
// }

// class WorkoutDialogState extends State<WorkoutDialog> {
//   List<dynamic> workoutPoses = [];

//   @override
//   void initState() {
//     _getWorkoutPoses(widget.sequence);
//     super.initState();
//   }

//   void _getWorkoutPoses(sequence) {
//     sequence.forEach((poseId) {
//       workoutPoses.add(poses.firstWhere((pose) => pose['id'] == poseId));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Stack(
//       children: [
//         WorkoutDisplay(workoutPoses: workoutPoses),
//         // cancel icon
//         Positioned(
//             left: 0.0,
//             top: 0.0,
//             child: SafeArea(
//                 child: IconButton(
//               icon: Icon(Icons.close, color: Colors.black54),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ))),
//       ],
//     ));
//   }
// }
