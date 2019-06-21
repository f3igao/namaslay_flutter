import 'package:cloud_firestore/cloud_firestore.dart';

List<dynamic> workouts = [];
Future fetchWorkoutsData() async {
  var getWorkouts = Firestore.instance.collection('workouts').getDocuments();
  await getWorkouts.then((paylod) {
    paylod.documents.forEach((workout) {
      workouts.add(workout.data);
    });
  });
}