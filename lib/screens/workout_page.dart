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
  List<dynamic> sequence;

  @override
  void initState() {
    Map sequenceRaw = widget.workoutData['sequence'];
    sequence = _configureSequence(sequenceRaw);
    _getWorkoutPoses(sequence);

    super.initState();
  }

  List<dynamic> _configureSequence(data) {
    List<dynamic> sequence = [];
    List<dynamic> sections = data.keys.toList();
    sections.sort();
    sections.forEach((section) {
      sequence.addAll(data[section]);
    });
    return sequence;
  }

  void _getWorkoutPoses(sequence) {
    sequence.forEach((poseId) {
      workoutPoses.add(poses.firstWhere((pose) => pose['id'] == poseId));
    });
  }

  void _openWorkoutDialog() {
    Navigator.of(context).push(MaterialPageRoute<Null>(
        builder: (BuildContext context) =>
            WorkoutDialog(workoutPoses: workoutPoses),
        fullscreenDialog: true));
  }

  @override
  Widget build(BuildContext context) {
    String _getWorkoutTitle() {
      return widget.workoutData['difficulty'].toUpperCase();
    }

    String _getWorkoutTime() {
      return (sequence.length * 10 / 60).round().toString();
    }

    return Scaffold(
      body: Stack(children: <Widget>[
        CustomScrollView(slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: WorkoutHeader(
              minExtent: (MediaQuery.of(context).size.height) / 5,
              maxExtent: (MediaQuery.of(context).size.height) / 2,
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
