import 'package:flutter/material.dart';
import 'package:namaslay_flutter/model/poses_data.dart';
import 'package:namaslay_flutter/widgets/poses_list.dart';
import 'package:namaslay_flutter/dialogs/workout_dialog.dart';
import '../widgets/workout_header.dart';

class WorkoutPage extends StatefulWidget {
  final Map<String, dynamic> workoutData;

  WorkoutPage({this.workoutData});

  @override
  State<StatefulWidget> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  List<dynamic> workoutPoses = [];
  List<dynamic> sequence = [];

  @override
  void initState() {
    sequence.addAll(widget.workoutData['sequence']);
    _getWorkoutPoses(sequence);
    super.initState();
  }

  void _getWorkoutPoses(sequence) {
    sequence.forEach((poseId) {
      workoutPoses.add(poses.firstWhere((pose) => pose['id'] == poseId,
          orElse: () => print('Error, pose not found in get workout method.')));
    });
  }

  void _openWorkoutDialog() {
    Navigator.of(context).push(MaterialPageRoute<Null>(
        builder: (BuildContext context) =>
            WorkoutDialog(workoutPoses: workoutPoses)));
  }

  @override
  Widget build(BuildContext context) {
    String _getWorkoutTitle() {
      return widget.workoutData['difficulty'].toUpperCase();
    }

    String _getWorkoutTime() {
      return sequence.length > 0
          ? (sequence.length * 10 / 60).round().toString()
          : '0';
    }

    return Scaffold(
      body: Stack(children: <Widget>[
        CustomScrollView(slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: WorkoutHeader(
              minExtent: (MediaQuery.of(context).size.height) * 0.20,
              maxExtent: (MediaQuery.of(context).size.height) * 0.50,
              workoutName: widget.workoutData['name'],
              workoutImageUrl: widget.workoutData['imageUrl'],
              openWorkoutDialog: _openWorkoutDialog,
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 4,
            ),
            delegate: SliverChildListDelegate(
              [
                Container(
                    child: Center(child: Text(_getWorkoutTime() + ' MIN')),
                    margin: EdgeInsets.only(top: 15.0, right: 60.0)),
                Container(
                    child: Center(child: Text(_getWorkoutTitle())),
                    margin: EdgeInsets.only(top: 15.0, left: 60.0)),
              ],
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
            [
              Container(
                child: Center(
                    child: Text(
                  widget.workoutData['description'],
                  textAlign: TextAlign.justify,
                )),
                padding: EdgeInsets.all(15.0),
              )
            ],
          )),
          PosesList(sequence: sequence),
        ]),
      ]),
    );
  }
}
