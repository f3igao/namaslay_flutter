import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HeroHeader implements SliverPersistentHeaderDelegate {
  final String workoutName;
  double maxExtent;
  double minExtent;

  HeroHeader({this.minExtent, this.maxExtent, this.workoutName});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/eneko-urunuela-646064-unsplash.jpg',
          fit: BoxFit.cover,
        ),
        // darkens image to make title more apparent
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black54,
              ],
              stops: [0.5, 1.0],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              tileMode: TileMode.repeated,
            ),
          ),
        ),
        // cancel X icon
        Positioned(
            left: 0.0,
            top: 0.0,
            child: SafeArea(
                child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ))),
        // workout title
        Center(
          child: Text(
            workoutName,
            style: TextStyle(fontSize: 36.0, color: Colors.white),
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;
}
