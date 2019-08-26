  String getWorkoutTime(workout) {
    List<dynamic> sequence = workout['sequence'];
    int poseCount = sequence.length;
    int minutes = (poseCount * 10 / 60).round();

    return '$minutes min';
  }