// import 'dart:async';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';

// class WorkoutDisplay extends StatefulWidget {
//   final List<dynamic> workoutPoses;
//   WorkoutDisplay({this.workoutPoses});

//   @override
//   WorkoutDisplayState createState() => WorkoutDisplayState();
// }

// class WorkoutDisplayState extends State<WorkoutDisplay> {
//   int poseCount;
//   int currentIndex = 0;
//   Timer workoutTimer;

//   @override
//   void initState() {
//     // _startWorkout();
//     poseCount = widget.workoutPoses.length;
//     workoutTimer = _startWorkoutTimer();
//     super.initState();
//   }

//   Timer _startWorkoutTimer() {
//     return Timer.periodic(Duration(seconds: 2), (timer) {
//       if (currentIndex >= poseCount) {
//         timer.cancel();
//       } else {
//         setState(() {
//           currentIndex += 1;
//           print(currentIndex);
//         });
//       }
//     });
//   }
//   // void _startWorkout(poses) {

//   //   Timer.periodic(Duration(seconds: 2), (timer) {
//   //     if (currentIndex >= poseCount) {
//   //       timer.cancel();
//   //     } else {
//   //       setState(() {
//   //         currentIndex += 1;
//   //         print(currentIndex);
//   //       });
//   //     }
//   //   });
//   // }

//   void _stopWorkout() {
//     workoutTimer.cancel();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Container(
//           margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
//           child: LinearProgressIndicator(
//             value: currentIndex / poseCount,
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.symmetric(vertical: 20.0),
//           height: (MediaQuery.of(context).size.height) / 2,
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(8.0),
//             child: Image(
//                 image: CachedNetworkImageProvider(
//               widget.workoutPoses[currentIndex]['imageUrl'],
//             )),
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.symmetric(vertical: 20.0),
//           child: Text(
//             widget.workoutPoses[currentIndex]['name'],
//             style: TextStyle(
//                 fontSize: 36,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.black54),
//           ),
//         ),
//       ],
//     );
//   }
// }
