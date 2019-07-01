import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:namaslay_flutter/pages/workout_page.dart';

List<String> mockThemes = [
  'Featured Workouts',
  'Recommended For You',
  'Heart Openers',
  'Hips Openers',
];

class HomePage extends StatelessWidget {
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
        body: HomeContainer());
  }
}

class HomeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: <Widget>[
        Expanded(
            child: ListView.builder(
          itemBuilder: _buildHomeRow,
          itemCount: mockThemes.length,
        ))
      ]),
    );
  }
}

Widget _buildHomeRow(BuildContext context, int index) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Text(mockThemes[index].toUpperCase(),
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple))),
      Container(
          padding: const EdgeInsets.only(left: 6.0, bottom: 8.0),
          child: _fetchWorkouts(context)),
    ],
  );
}

Widget _fetchWorkouts(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection('workouts').snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return Container();
      return _buildWorkoutsRow(context, snapshot.data.documents);
    },
  );
}

Widget _buildWorkoutsRow(
    BuildContext context, List<DocumentSnapshot> workouts) {
  return Row(children: [
    Expanded(
        child: SizedBox(
            height: 170.0,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: workouts
                    .map((workout) => _buildWorkoutTile(context, workout))
                    .toList())))
  ]);
}

Widget _buildWorkoutTile(BuildContext context, DocumentSnapshot workout) {
  final double _tileWidth = 250.0;
  return Column(
    children: <Widget>[
      InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      WorkoutPage(workoutData: workout.data)));
        },
        child: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                workout.data['imageUrl'],
                fit: BoxFit.cover,
                alignment: Alignment(0, -0.5),
              ),
            ),
            height: 125.0,
            width: _tileWidth,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      offset: Offset(2.0, 6.0))
                ]),
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0)),
      ),
      Text(
        workout.data['name'],
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black54),
      ),
      Text(
        '6 min',
        style: TextStyle(color: Colors.black45, fontSize: 14),
      )
    ],
  );
}
