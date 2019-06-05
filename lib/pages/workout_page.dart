import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WorkoutPage extends StatelessWidget {
  final String workoutName;
  WorkoutPage(this.workoutName);

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(workoutName),
    //   ),
    //   body: Container(),
    // );

    return Material(
        child: Container(
            child: CustomScrollView(slivers: <Widget>[
      SliverPersistentHeader(
        pinned: true,
        delegate: WorkoutHeader(
          // layoutGroup: layoutGroup,
          // onLayoutToggle: onLayoutToggle,
          minExtent: 150.0,
          maxExtent: 250.0,
          workoutName: workoutName,
        ),
      ),
    ])));
  }
}

class WorkoutHeader implements SliverPersistentHeaderDelegate {
  // final LayoutGroup layoutGroup;
  // final VoidCallback onLayoutToggle;
  final String workoutName;
  double maxExtent;
  double minExtent;
  WorkoutHeader(
      {
      // this.layoutGroup,
      // this.onLayoutToggle,
      this.minExtent,
      this.maxExtent,
      this.workoutName});

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
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black54,
              ],
              stops: [0.5, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.repeated,
            ),
          ),
        ),
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
        // Positioned(
        //   left: 16.0,
        //   right: 16.0,
        //   bottom: 16.0,
        //   child: Text(
        //     workoutName,
        //     style: TextStyle(fontSize: 32.0, color: Colors.white),
        //   ),
        // ),
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
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;
}
