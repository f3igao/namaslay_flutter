import 'package:flutter/material.dart';

class Home extends StatelessWidget {
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
          HomeRow(),
          HomeRow(),
          HomeRow(),
          HomeRow(),
          HomeRow(),
        ],
      )),
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
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            MockCard(),
            MockCard(),
            MockCard(),
            MockCard(),
          ],
        ));
  }
}

class MockCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(child: Text('test123')),
        width: 150,
        color: Colors.amber,
        margin: EdgeInsets.all(15));



  }
}
