import 'package:flutter/material.dart';
import 'package:namaslay_flutter/model/poses_data.dart';

class WorkoutDialog extends StatefulWidget {
  final Map<dynamic, dynamic> workout;
  WorkoutDialog({this.workout});

  @override
  WorkoutDialogState createState() => WorkoutDialogState();
}

class WorkoutDialogState extends State<WorkoutDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      // fit: StackFit.expand,
      children: [
        Positioned(
          top: 1.0,
            child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              child: WorkoutProgressIndicator(),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                poses[0]['imageUrl'],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                poses[0]['name'],
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54),
              ),
            ),
            // Container(
            //   margin: EdgeInsets.all(10.0),
            //   child: WorkoutProgressIndicator(),
            // )
          ],
        )),
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

class WorkoutProgressIndicator extends StatefulWidget {
  @override
  _WorkoutProgressIndicatorState createState() =>
      _WorkoutProgressIndicatorState();
}

class _WorkoutProgressIndicatorState extends State<WorkoutProgressIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
    // ..addListener(() {
    //   setState(() {
    //     // the state that has changed here is the animation object’s value
    //   });
    // });
    controller.repeat();
  }

  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: LinearProgressIndicator(
        value: animation.value,
      ),
    ));
  }
}
