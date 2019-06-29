// import 'package:flutter/material.dart';

// class WorkoutControl extends StatelessWidget {
//   final Function playWorkout;
//   final bool isPlaying;

//   WorkoutControl({this.playWorkout, this.isPlaying});

//   @override
//   Widget build(BuildContext context) {
//     String text = isPlaying ? 'PAUSE' : 'PLAY';
//     IconData icon = isPlaying ? Icons.pause : Icons.play_arrow;
//     Color color = isPlaying ? Colors.blue[200] : Colors.blue;

//     return Positioned(
//         child: FloatingActionButton.extended(
//           onPressed: () {
//             playWorkout();
//           },
//           icon: Icon(icon),
//           label: Text(
//             text,
//             style: TextStyle(fontSize: 20.0),
//           ),
//           backgroundColor: color,
//         ),
//         top: 220.0,
//         left: 130.0,
//         width: 150.0,
//         height: 60.0);
//   }
// }