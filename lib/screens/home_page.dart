import 'package:flutter/material.dart';
import 'package:namaslay_flutter/dialogs/subscription_dialog.dart';
import 'package:namaslay_flutter/util/model_helpers.dart';
import 'package:namaslay_flutter/screens/workout_page.dart';
import 'package:namaslay_flutter/util/workout_helpers.dart';
import 'package:namaslay_flutter/widgets/cached_image.dart';
import 'package:namaslay_flutter/widgets/premium_lock.dart';
import 'package:namaslay_flutter/util/globals.dart' as globals;

List<String> homepageSections = [
  'featured workouts',
  'recommended for you',
  'on the go',
  'wind down',
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
          itemCount: homepageSections.length,
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
          child: Text(homepageSections[index].toUpperCase(),
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple))),
      Container(
          padding: const EdgeInsets.only(left: 6.0, bottom: 8.0),
          height: (MediaQuery.of(context).size.height) * 0.33,
          child: _buildWorkoutsRow(context, homepageSections[index])),
    ],
  );
}

Widget _buildWorkoutsRow(BuildContext context, section) {
  List<dynamic> sectionWorkouts = [];

  switch (section) {
    case 'featured workouts':
      sectionWorkouts.addAll(latestWorkouts());
      break;
    case 'recommended for you':
      sectionWorkouts.addAll(recommendedWorkouts());
      break;
    case 'on the go':
      sectionWorkouts.addAll(shortWorkouts());
      break;
    case 'wind down':
      sectionWorkouts.addAll(taggedWorkouts('relax'));
      break;
  }

  return Row(children: <Widget>[
    Expanded(
        child: SizedBox(
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: sectionWorkouts
                    .map((workout) => _buildWorkoutTile(context, workout))
                    .toList())))
  ]);
}

Widget _buildWorkoutTile(BuildContext context, Map<dynamic, dynamic> workout) {
  void _openSubscriptionDialog() {
    Navigator.of(context).push(MaterialPageRoute<Null>(
        builder: (BuildContext context) => SubscriptionDialog()));
  }

  return Column(
    children: <Widget>[
      InkWell(
          onTap: () {
            (workout['isPremium'] && !globals.isPremium)
                ? _openSubscriptionDialog()
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            WorkoutPage(workoutData: workout)));
          },
          child: Stack(
            children: <Widget>[
              Container(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: CachedImage(
                          url: workout['imageUrl'], showLoader: true)),
                  height: (MediaQuery.of(context).size.height) * 0.22,
                  width: 250.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10.0,
                            offset: Offset(2.0, 6.0))
                      ]),
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0)),
              Positioned(
                  right: 15.0,
                  top: 15.0,
                  child: (workout['isPremium'] && !globals.isPremium)
                      ? PremiumLock(18.0, 5.0)
                      : Container())
            ],
          )),
      Text(
        workout['name'],
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black54),
      ),
      Text(
        getWorkoutTime(workout),
        style: TextStyle(color: Colors.black45, fontSize: 14),
      )
    ],
  );
}
