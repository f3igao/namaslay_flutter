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
          height: 170.0,
          margin: EdgeInsets.only(bottom: 24.0),
          decoration: new BoxDecoration(
            color: Colors.amber,
            borderRadius: new BorderRadius.all(new Radius.circular(16.0)),
          ),
        )
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
