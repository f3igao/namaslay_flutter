
import 'package:flutter/material.dart';
import '../filters.dart';
import 'workout_cards.dart';

List<String> _mockWorkouts = [
  'Heart Opener',
  'Hips Opener',
  'Sunrise Yoga',
  'Wind Down',
  'Bedtime Yoga',
  'Cardio Blast',
  'Power Your Purpose',
  'Find Your Flow',
  'Meditation in Motion',
  'Calm Your Mind',
  'Mental Detox',
  'Root Down',
  'Playtime'
];

class WorkoutsContainer extends StatelessWidget {
  const WorkoutsContainer({Key key, this.filter}) : super(key: key);

  final Filter filter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: Column(              
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[Expanded(child: WorkoutCards(_mockWorkouts))],
      ),
    );
  }
}
