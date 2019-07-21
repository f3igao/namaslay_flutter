import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PoseHeader implements SliverPersistentHeaderDelegate {
  double maxExtent;
  double minExtent;
  final String poseName;
  final String poseSanskrit;

  PoseHeader({
    this.minExtent,
    this.maxExtent,
    this.poseName,
    this.poseSanskrit,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SafeArea(
      child: Stack(fit: StackFit.expand, children: [
        Container(
          color: Colors.white,
          margin: EdgeInsets.only(top: 20.0),
          child: Column(
            children: <Widget>[
              Text(poseName,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54)),
              Text(poseSanskrit, style: TextStyle(color: Colors.purple))
            ],
          ),
        ),
        //       // cancel icon
        Positioned(
            left: 0.0,
            top: 0.0,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black54),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
      ]),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;
}
