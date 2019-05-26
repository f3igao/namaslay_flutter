import 'package:flutter/material.dart';

List<String> mockWorkouts = [
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

List<String> mockThemes = [
  'Featured Workouts',
  'Crowd Favorites',
  'Heart Openers',
  'Hips Openers',
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
        ));
  }
}

Widget _buildHomeRow(BuildContext context, int index) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Text(mockThemes[index],
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87))),
      Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
          child: Row(children: [
            Expanded(
                child: SizedBox(
                    height: 150.0,
                    child: ListView.builder(
                      itemBuilder: _buildWorkoutTile,
                      itemCount: mockWorkouts.length,
                      scrollDirection: Axis.horizontal,
                    )))
          ])),
    ],
  );
}

Widget _buildWorkoutTile(BuildContext context, int index) {
  return Container(
      child: Center(child: Text(mockWorkouts[index])),
      width: 200.0,
      decoration: new BoxDecoration(
        color: Colors.amber,
        borderRadius: new BorderRadius.all(new Radius.circular(16.0)),
      ),
      margin: EdgeInsets.all(10));
}
