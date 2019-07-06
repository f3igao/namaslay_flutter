import 'dart:async';
import 'package:flutter/material.dart';
import 'package:namaslay_flutter/model/poses_data.dart';

class WorkoutDisplay extends StatefulWidget {
  final List<dynamic> workoutPoses;
  WorkoutDisplay({this.workoutPoses});

  @override
  WorkoutDisplayState createState() => WorkoutDisplayState();
}

class WorkoutDisplayState extends State<WorkoutDisplay>
    with SingleTickerProviderStateMixin {
  AnimationController animation;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    animation.addListener(() {
      this.setState(() {});
    });
  }
  // int currentIndex = 1;
  // int poseCount = 3;

  // void _calculateProgress() {
  //   progress = currentIndex / poseCount;
  //   print(progress);
  // }

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
    // count down 3 2 1
    // start workout

    // _startWorkout();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          // child: WorkoutProgressIndicator(),
          child: LinearProgressIndicator(
              // value: currentIndex / poseCount,
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
