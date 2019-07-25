import 'package:flutter/material.dart';
import 'package:namaslay_flutter/model/workouts_data.dart';
import 'package:namaslay_flutter/widgets/workout_card.dart';

class WorkoutsList extends StatelessWidget {
  const WorkoutsList({Key key, this.filter}) : super(key: key);

  final Filter filter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: workoutsList(context, filter),
    );
  }
}

Widget workoutsList(BuildContext context, Filter filter) {
  filterWorkouts(tags) {
    if (filter.title == 'All') return true;
    return tags.contains(filter.title.toLowerCase());
  }

  return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
            child: ListView(
                children: workouts
                    .map((workout) => filterWorkouts(workout['tags'])
                        ? workoutCard(context, workout)
                        : Container())
                    .toList()))
      ]);
}
