import 'package:flutter/material.dart';
import 'package:namaslay_flutter/model/poses_data.dart';
import 'package:namaslay_flutter/shared/workout_display.dart';

class WorkoutDialog extends StatelessWidget {
  final List<dynamic> sequence;
  WorkoutDialog({this.sequence});

  // int currentIndex = 0;
  // int poseCount = 0;
  List<dynamic> workoutPoses = [];

  // void _calculateProgress() {
  //   progress = currentIndex / poseCount;
  //   print(progress);
  // }

  void _getWorkoutPoses() {
    sequence.forEach((poseId) {
      workoutPoses.add(poses.firstWhere((pose) => pose['id'] == poseId));
    });
    print(workoutPoses);
  }

  // void _startWorkout() {
  //   Timer.periodic(Duration(seconds: 2), (timer) {
  //     if (currentIndex >= poseCount) {
  //       timer.cancel();
  //     } else {
  //       // setState(() {
  //       currentIndex += 1;
  //       print(currentIndex);
  //       // _calculateProgress();
  //       // });
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    _getWorkoutPoses();

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

// class WorkoutDialogState extends State<WorkoutDialog> {
//   int currentIndex = 0;
//   int poseCount = 0;
//   List<dynamic> workoutPoses = [];

//   void _buildWorkoutPoses() {
//     widget.sequence.forEach((poseId) {
//       workoutPoses.add(poses.firstWhere((pose) => pose['id'] == poseId));
//     });
//     poseCount = widget.sequence.length;
//   }

//   // void _calculateProgress() {
//   //   progress = currentIndex / poseCount;
//   //   print(progress);
//   // }

//   void _startWorkout() {
//     Timer.periodic(Duration(seconds: 2), (timer) {
//       if (currentIndex >= poseCount) {
//         timer.cancel();
//       } else {
//         // setState(() {
//         currentIndex += 1;
//         print(currentIndex);
//         // _calculateProgress();
//         // });
//       }
//     });
//   }

//   // @override
//   // Widget build(BuildContext context) {
//   //   _buildWorkoutPoses();
//   //   // count down 3 2 1
//   //   // start workout

//   //   _startWorkout();

//   //   return
//   // }
// }
