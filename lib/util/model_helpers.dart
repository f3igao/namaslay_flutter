import 'package:namaslay_flutter/model/workouts_data.dart';

String buildTitle(string) => '${string[0].toUpperCase()}${string.substring(1)}';

List<dynamic> latestWorkouts() {
  List<dynamic> list = []..addAll(workouts);
  int end = (list.length >= 3) ? 3 : list.length;
  list.sort((a, b) {
    return b['timestamp'].compareTo(a['timestamp']);
  });
  return list.sublist(0, end);
}

List<dynamic> recommendedWorkouts() {
  List<dynamic> list = workouts.toList()..shuffle();
  int end = (list.length >= 5) ? 5 : list.length;
  return list.sublist(0, end);
}

int _totalTime(workout) {
  int poseCount = workout['sequence'].length;
  int minutes = (poseCount * 10 / 60).round();
  return minutes;
}

List<dynamic> shortWorkouts() {
  List<dynamic> list =
      workouts.where((workout) => _totalTime(workout) <= 5).toList();
  int end = (list.length >= 5) ? 5 : list.length;
  return list.sublist(0, end);
}

List<dynamic> taggedWorkouts(tag) {
  List<dynamic> list =
      workouts.where((workout) => workout['tags'].contains(tag)).toList();
  int end = (list.length >= 5) ? 5 : list.length;
  return list.sublist(0, end);
}
