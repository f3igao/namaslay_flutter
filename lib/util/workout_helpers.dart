  String getWorkoutTime(workout) {
    List<dynamic> sequence = [];
    List<dynamic> sections = workout['sequence'].keys.toList();
    sections.forEach((section) {
      sequence.addAll(workout['sequence'][section]);
    });
    int poseCount = sequence.length;
    int minutes = (poseCount * 10 / 60).round();

    return '$minutes min';
  }