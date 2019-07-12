import 'package:cloud_firestore/cloud_firestore.dart';

class Filter {
  const Filter({this.title});
  final String title;
}

String buildTitle(string) => '${string[0].toUpperCase()}${string.substring(1)}';


List<dynamic> workouts = [];
List<Filter> workoutFilters = [
  const Filter(title: 'All'),
];

Future fetchWorkoutsData() async {
  var getWorkouts = Firestore.instance.collection('workouts').getDocuments();
  await getWorkouts.then((paylod) {
    paylod.documents.forEach((workout) {
      workouts.add(workout.data);
      if (workout.data['tags'].length > 0) {
        workout.data['tags'].forEach((tag) {
          workoutFilters.add(Filter(title: buildTitle(tag.toString())));
        });
      }
    });
  });
}
