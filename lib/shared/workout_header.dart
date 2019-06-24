import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WorkoutHeader implements SliverPersistentHeaderDelegate {
  final String workoutName;
  double maxExtent;
  double minExtent;

  WorkoutHeader({this.minExtent, this.maxExtent, this.workoutName});

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
        // workout title
        Center(
          child: Text(
            workoutName,
            style: TextStyle(fontSize: 36.0, color: Colors.white),
          ),
        ),
        GestureDetector(
          onTap: () {
            print('tap');
          },
          // darkens image to make title more apparent
          child: Container(
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
        FractionalTranslation(
            translation: Offset(0, 0.5),
            child: Container(
                width: 200.0,
                height: 200.0,
                child: RawMaterialButton(
                  // fillColor: Colors.amber,
                  // padding: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(),
                  // elevation: 5.0,
                  child: Text('PLAyY'),
                  onPressed: () {},
                ))),
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;
}
