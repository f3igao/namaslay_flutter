import 'package:flutter/material.dart';
import 'package:namaslay_flutter/dialogs/subscription_dialog.dart';
import 'package:namaslay_flutter/screens/workout_page.dart';
import 'package:namaslay_flutter/util/workout_helpers.dart';
import 'package:namaslay_flutter/widgets/cached_image.dart';
import 'package:namaslay_flutter/widgets/premium_lock.dart';

import '../app.dart';

Widget workoutCard(BuildContext context, Map workout) {
  Map<String, dynamic> workoutData = workout;

  void _openSubscriptionDialog() {
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context) => SubscriptionDialog(),
    ));
  }

  return InkWell(
      onTap: () {
        (workoutData['isPremium'] && !isPremium)
            ? _openSubscriptionDialog()
            : Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        WorkoutPage(workoutData: workoutData)));
      },
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 8 / 5,
                child: Container(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: CachedImage(
                        url: workoutData['imageUrl'],
                        showLoader: true,
                        alignY: -0.5,
                      )),
                  margin: EdgeInsets.only(bottom: 10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10.0,
                            offset: Offset(2.0, 6.0))
                      ]),
                ),
              ),
              Positioned(
                  right: 10.0,
                  top: 10.0,
                  child: (workoutData['isPremium'] && !isPremium)
                      ? PremiumLock(20.0, 8.0)
                      : Container())
            ],
          ),
          Text(
            workoutData['name'],
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black54),
          ),
          Container(
            child: Text(
              getWorkoutTime(workoutData),
              style: TextStyle(color: Colors.black45, fontSize: 16),
            ),
            margin: EdgeInsets.only(bottom: 10.0),
          )
        ],
      ));
}
