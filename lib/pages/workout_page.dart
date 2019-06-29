import 'package:flutter/material.dart';
import 'package:namaslay_flutter/shared/poses_list.dart';
import '../shared/workout_header.dart';

class WorkoutPage extends StatefulWidget {
  final Map<String, dynamic> workoutData;
  WorkoutPage({this.workoutData});

  @override
  State<StatefulWidget> createState() {
    return _WorkoutPageState();
  }
}

class _WorkoutPageState extends State<WorkoutPage> {
  @override
  Widget build(BuildContext context) {
    Map sequenceRaw = widget.workoutData['sequence'];
    List<dynamic> sequence = _configureSequence(sequenceRaw);

    Function _getWorkoutTitle = () => widget.workoutData['level'].toUpperCase();
    Function _getWorkoutTime = () => (sequence.length * 5 / 60).toString();

    return Scaffold(
      body: Stack(children: [
        CustomScrollView(slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: WorkoutHeader(
              minExtent: (MediaQuery.of(context).size.height) / 5,
              maxExtent: (MediaQuery.of(context).size.height) / 2,
              workoutName: widget.workoutData['name'],
              workoutImageUrl: widget.workoutData['imageUrl'],
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
                    child: Center(
                        child: Text(
                            _getWorkoutTime() + ' MIN')),
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

List<dynamic> _configureSequence(data) {
  List<dynamic> sequence = [];
  List<dynamic> sections = data.keys.toList();
  sections.sort();
  sections.forEach((section) {
    sequence.addAll(data[section]);
  });
  return sequence;
}
