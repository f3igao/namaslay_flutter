import 'package:flutter/material.dart';
import 'package:namaslay_flutter/model/poses_data.dart';

class WorkoutDialog extends StatefulWidget {
  final List<dynamic> sequence;
  WorkoutDialog({this.sequence});

  @override
  WorkoutDialogState createState() => WorkoutDialogState();
}

class WorkoutDialogState extends State<WorkoutDialog> {
  double progress = 0.0;
  int index = 0;

    Map<dynamic, dynamic> _getPose() {
    return poses.firstWhere((pose) => pose['id'] == widget.sequence[index],
        orElse: () => print('Error, pose not found.'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      // fit: StackFit.expand,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              // child: WorkoutProgressIndicator(),
              child: LinearProgressIndicator(
                value: progress,
              ),
            ),
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                print('+ progress');
                setState(() {
                  progress += 0.2;
                  index += 1;
                });
              },
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              // color: Colors.amber,
              height: (MediaQuery.of(context).size.height) / 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  _getPose()['imageUrl'],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                _getPose()['name'],
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

// class WorkoutProgressIndicator extends StatefulWidget {
//   @override
//   _WorkoutProgressIndicatorState createState() =>
//       _WorkoutProgressIndicatorState();
// }

// class _WorkoutProgressIndicatorState extends State<WorkoutProgressIndicator>
//     with SingleTickerProviderStateMixin {
//   AnimationController controller;
//   Animation<double> animation;

//   @override
//   void initState() {
//     super.initState();
//     controller = AnimationController(
//         duration: const Duration(milliseconds: 2000), vsync: this);
//     animation = Tween(begin: 0.0, end: 1.0).animate(controller);
//     // ..addListener(() {
//     //   setState(() {
//     //     // the state that has changed here is the animation object’s value
//     //   });
//     // });
//     controller.repeat();
//   }

//   @override
//   void dispose() {
//     controller.stop();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: Container(
//       child: LinearProgressIndicator(
//         value: animation.value,
//       ),
//     ));
//   }
// }
