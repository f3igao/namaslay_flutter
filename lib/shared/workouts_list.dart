import 'package:flutter/material.dart';
import 'package:namaslay_flutter/model/workouts_data.dart';
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
      children: [
        Expanded(
            child: ListView(
                children: workouts
                    .map((workout) => filterWorkouts(workout['tags'])
                        ? workoutCard(context, workout)
                        : Container())
                    .toList()))
      ]);
}

Widget workoutCard(BuildContext context, Map workout) {
  Map<String, dynamic> workoutData = workout;

  return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WorkoutPage(workoutData: workoutData)));
      },
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            workoutData['imageUrl'],
            fit: BoxFit.cover,
            alignment: Alignment(0, -0.5),
          ),
        ),
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
