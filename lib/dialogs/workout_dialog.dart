import 'dart:async';
import 'package:flutter/material.dart';
import 'package:namaslay_flutter/widgets/cached_image.dart';
import 'package:namaslay_flutter/widgets/countdown.dart';

class WorkoutDialog extends StatefulWidget {
  final List<dynamic> workoutPoses;

  WorkoutDialog({this.workoutPoses});

  @override
  WorkoutDialogState createState() => WorkoutDialogState();
}

class WorkoutDialogState extends State<WorkoutDialog>
    with TickerProviderStateMixin {
  AnimationController _controller;
  int poseCount;
  int currentIndex = 0;
  double progress = 0.0;
  int time;
  Timer workoutTimer;
  bool isPlaying = false;

  @override
  void initState() {
    poseCount = widget.workoutPoses.length;
    time = (poseCount * 10 / 60).round();
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        workoutTimer = _startWorkoutTimer();
      }
    });
    _controller.forward(from: 0.0);
  }

  Timer _startWorkoutTimer() {
    isPlaying = true;
    return Timer.periodic(Duration(seconds: 3), (timer) {
      if (currentIndex >= poseCount - 1) {
        timer.cancel();
        setState(() {
          progress = 1.0;
        });
        return Timer(Duration(seconds: 2), _completeWorkout);
      } else {
        return Timer(Duration(seconds: 0), () {
          setState(() {
            currentIndex += 1;
            progress = currentIndex / poseCount;
          });
        });
      }
    });
  }

  void _stopWorkout() {
    workoutTimer.cancel();
    print('workout stopped');
  }

  void _completeWorkout() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Namaste"),
          content: Text(
              "You just completed a workout! Take a moment to thank yourself for dedicating the past $time minutes to your body and mind."),
          actions: <Widget>[
            FlatButton(
              child: Text("Do it again".toUpperCase()),
              onPressed: () {
                setState(() {
                  isPlaying = false;
                  currentIndex = 0;
                  progress = 0.0;
                  _controller.forward(from: 0.0);
                });
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text("Close".toUpperCase()),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        AnimatedCrossFade(
          firstChild: Countdown(
            animation: StepTween(
              begin: 4,
              end: 1,
            ).animate(_controller),
          ),
          secondChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.purpleAccent,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: (MediaQuery.of(context).size.height) / 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: CachedImage(
                      url: widget.workoutPoses[currentIndex]['imageUrl']),
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
          crossFadeState:
              isPlaying ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: Duration(seconds: 1),
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
                _stopWorkout();
              },
            ))),
      ],
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
