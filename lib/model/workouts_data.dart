import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:namaslay_flutter/util/model_helpers.dart';

List<dynamic> workouts = [];
List<String> workoutFilters = ['All'];

Future fetchWorkoutsData() async {
  var getWorkouts = Firestore.instance.collection('workouts').getDocuments();
  await getWorkouts.then((paylod) {
    paylod.documents.forEach((workout) {
      workouts.add(workout.data);
      if (workout.data.containsKey('tags') && workout.data['tags'].length > 0) {
        workout.data['tags'].forEach((tag) {
          String currentFilter = buildTitle(tag.toString());
          if (!workoutFilters.contains(currentFilter)) {
            workoutFilters.add(currentFilter);
          }
        });
      }
    });
  });
}
