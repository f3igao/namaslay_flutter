import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
      child: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
            itemBuilder: _buildHomeRow,
            itemCount: mockThemes.length,
          ))
        ],
      ),
    );
  }
}

Widget _buildHomeRow(BuildContext context, int index) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(mockThemes[index],
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87))),
      Padding(
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
            height: 150.0,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: workouts
                    .map((workout) => _buildWorkoutTile(context, workout))
                    .toList())))
  ]);
}

Widget _buildWorkoutTile(BuildContext context, DocumentSnapshot workout) {
  return Container(
      child: Center(child: Text(workout.data['name'])),
      width: 250.0,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      margin: EdgeInsets.all(10.0));
}