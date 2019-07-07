import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WorkoutHeader implements SliverPersistentHeaderDelegate {
  double maxExtent;
  double minExtent;
  final String workoutName;
  final String workoutImageUrl;
  final Function openWorkoutDialog;

  WorkoutHeader(
      {this.minExtent,
      this.maxExtent,
      this.workoutName,
      this.workoutImageUrl,
      this.openWorkoutDialog});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image(
          image: CachedNetworkImageProvider(
            workoutImageUrl,
          ),
          fit: BoxFit.cover,
          alignment: Alignment(0, -0.6),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black87,
              ],
              stops: [0.5, 1.0],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              tileMode: TileMode.repeated,
            ),
          ),
        ),
        // workout title
        Container(
          alignment: Alignment.center,
          child: Text(
            workoutName,
            style: TextStyle(fontSize: 36.0, color: Colors.white),
          ),
          decoration: BoxDecoration(
            color: Colors.black54,
          ),
          padding: EdgeInsets.all(10.0),
        ),
        // go back
        Positioned(
            left: 0.0,
            top: 0.0,
            child: SafeArea(
                child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ))),
        // play button
        Positioned(
          bottom: 0.0,
          left: (MediaQuery.of(context).size.width) / 2 - 75.0,
          child: FractionalTranslation(
              translation: Offset(0, 0.5),
              child: Container(
                width: 150.0,
                height: 60.0,
                child: FloatingActionButton.extended(
                  onPressed: () => {
                        openWorkoutDialog(),
                      },
                  icon: Icon(Icons.play_arrow),
                  label: Text('PLAY', style: TextStyle(fontSize: 20.0)),
                  backgroundColor: Colors.purple,
                ),
              )),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;
}
