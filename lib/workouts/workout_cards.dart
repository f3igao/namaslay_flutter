import 'package:flutter/material.dart';

class WorkoutCards extends StatelessWidget {
  final List<String> workouts;
  WorkoutCards([this.workouts = const []]);

  Widget _buildWorkoutCard(BuildContext context, int index) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Column(
      children: <Widget>[
        Container(
            child: Center(child: Text(workouts[index], style: textStyle)),
            height: 150,
            color: Colors.amber,
            margin: EdgeInsets.all(15))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildWorkoutCard,
      itemCount: workouts.length,
    );
  }
}
