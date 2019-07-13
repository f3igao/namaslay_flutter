import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:namaslay_flutter/model/workouts_data.dart';
import 'package:namaslay_flutter/pages/workout_page.dart';
import 'package:namaslay_flutter/shared/cached_image.dart';
import 'package:transparent_image/transparent_image.dart';

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

  String _getWorkoutTime() {
    List<dynamic> sequence = [];
    List<dynamic> sections = workoutData['sequence'].keys.toList();
    sections.forEach((section) {
      sequence.addAll(workoutData['sequence'][section]);
    });
    int poseCount = sequence.length;
    int minutes = (poseCount * 10 / 60).round();

    return '$minutes min';
  }

  return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WorkoutPage(workoutData: workoutData)));
      },
      child: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 8 / 5,
            child: Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: CachedImage(
                    url: workoutData['imageUrl'],
                    showLoader: true,
                    alignmentY: -0.5,
                  )),
              margin: EdgeInsets.only(bottom: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10.0,
                        offset: Offset(2.0, 6.0))
                  ]),
            ),
          ),
          Text(
            workoutData['name'],
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black54),
          ),
          Container(
            child: Text(
              _getWorkoutTime(),
              style: TextStyle(color: Colors.black45, fontSize: 16),
            ),
            margin: EdgeInsets.only(bottom: 10.0),
          )
        ],
      ));
}
