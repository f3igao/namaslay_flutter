// import 'package:flutter/material.dart';

// class WorkoutDisplay extends StatelessWidget {
//   Map<dynamic, dynamic> pose;
//   int currentIndex;
//   int poseCount;
//   WorkoutDisplay({this.pose, this.currentIndex, this.poseCount}); // costructor shortcut, omitting {}

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Container(
//           margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
//           // child: WorkoutProgressIndicator(),
//           child: LinearProgressIndicator(
//             value: currentIndex / poseCount,
//           ),
//         ),
//         // FloatingActionButton(
//         //   child: Icon(Icons.add),
//         //   onPressed: () {
//         //     setState(() {
//         //       currentIndex += 1;
//         //       _calculateProgress();
//         //     });
//         //   },
//         // ),
//         Container(
//           margin: EdgeInsets.symmetric(vertical: 20.0),
//           height: (MediaQuery.of(context).size.height) / 2,
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(8.0),
//             // child: Image.network(
//             //   workoutPoses[currentIndex]['imageUrl'],
//             // ),
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.symmetric(vertical: 20.0),
//           child: Text(
//             workoutPoses[currentIndex]['name'],
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
