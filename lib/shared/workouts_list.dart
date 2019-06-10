import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:namaslay_flutter/pages/workout_page.dart';
import '../filters.dart';

class WorkoutsList extends StatelessWidget {
  const WorkoutsList({Key key, this.filter}) : super(key: key);

  final Filter filter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: _fetchWorkouts(context, filter),
    );
  }
}

Widget _fetchWorkouts(BuildContext context, Filter filter) {
  return StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection('workouts').snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return Container();
      // LinearProgressIndicator();
      return _buildWorkoutsList(context, snapshot.data.documents, filter);
    },
  );
}

Widget _buildWorkoutsList(
    BuildContext context, List<DocumentSnapshot> workouts, Filter filter) {
  filterWorkouts(tags) {
    if (filter.title == 'All') return true;
    return tags.contains(filter.title.toLowerCase());
  }

  return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: ListView(
                children: workouts
                    .map((workout) => filterWorkouts(workout.data['tags'])
                        ? _buildWorkoutCard(context, workout)
                        : Container())
                    .toList()))
      ]);
}

Widget _buildWorkoutCard(BuildContext context, DocumentSnapshot workout) {
  final TextStyle textStyle = Theme.of(context).textTheme.display1;
  final workoutName = workout.data['name'];
  return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => WorkoutPage(workoutName)));
      },
      child: Container(
        child: Center(child: Text(workoutName, style: textStyle)),
        height: 170.0,
        margin: EdgeInsets.only(bottom: 24.0),
        decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: Offset(2.0, 6.0))
            ]),
      ));
}
