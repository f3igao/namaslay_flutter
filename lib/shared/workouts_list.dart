import 'package:flutter/material.dart';
import '../filters.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WorkoutsList extends StatelessWidget {
  const WorkoutsList({Key key, this.filter}) : super(key: key);

  final Filter filter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: _fetchData(context),
    );
  }
}

Widget _fetchData(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection('workouts').snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return LinearProgressIndicator();
      return _buildWorkoutsList(context, snapshot.data.documents);
    },
  );
}

Widget _buildWorkoutsList(
    BuildContext context, List<DocumentSnapshot> workouts) {
  return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: ListView(
                children: workouts
                    .map((workout) => _buildWorkoutCard(context, workout))
                    .toList()))
      ]);
}

Widget _buildWorkoutCard(BuildContext context, DocumentSnapshot workout) {
  final TextStyle textStyle = Theme.of(context).textTheme.display1;
  return Container(
    child: Center(child: Text(workout.data['name'], style: textStyle)),
    height: 170.0,
    margin: EdgeInsets.only(bottom: 24.0),
    decoration: new BoxDecoration(
      color: Colors.amber,
      borderRadius: new BorderRadius.all(new Radius.circular(16.0)),
    ),
  );
}
