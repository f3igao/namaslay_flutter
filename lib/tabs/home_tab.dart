import 'package:flutter/material.dart';

List<String> mockWorkouts = [
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

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        child: ListView(
        children: <Widget>[
          HomeRow('1'),
          HomeRow('2'),
          HomeRow('3'),
          HomeRow('4'),
          HomeRow('5'),
        ],
        // children: <Widget>[... flows.map((flow)=> HomeRow(flow)])
        //  child: _buildWorkoutsList(context)
      ),
    );
  }
}

List<String> flows = [
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

class HomeRow extends StatelessWidget {
  final String workoutTheme;
  HomeRow(this.workoutTheme);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(workoutTheme, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        Workouts(),
      ],
    );
  }
}

  Widget _buildWorkoutsList(BuildContext context) {
    return ListView.builder(itemBuilder: _buildWorkoutTile, itemCount: flows.length);
  }

  Widget _buildWorkoutsRow(BuildContext context, int index) {
    return Column(
      children: <Widget>[
        Text(mockWorkouts[index], style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        ListView.builder(itemBuilder: _buildWorkoutTile, itemCount: flows.length)
      ],
    );
  }

  Widget _buildWorkoutTile(BuildContext context, int index) {
    return Container(
        child: Center(child: Text(flows[index])),
        width: 150,
        color: Colors.amber,
        margin: EdgeInsets.all(15));
  }

class Workouts extends StatelessWidget {
  @override





  Widget build(BuildContext context) {
    return Container(
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            WorkoutTile(flows[0]),
            WorkoutTile(flows[1]),
            WorkoutTile(flows[2]),
            WorkoutTile(flows[3]),
          ],
        ));
  }
}

class WorkoutTile extends StatelessWidget {
  final String flowName;
  WorkoutTile(this.flowName);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(child: Text(this.flowName)),
        width: 150,
        color: Colors.amber,
        margin: EdgeInsets.all(15));
  }
}
