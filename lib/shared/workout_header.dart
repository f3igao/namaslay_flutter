import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:namaslay_flutter/shared/workout_dialog.dart';

class WorkoutHeader implements SliverPersistentHeaderDelegate {
  final String workoutName;
  double maxExtent;
  double minExtent;

  WorkoutHeader({this.minExtent, this.maxExtent, this.workoutName});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    void _openWorkoutDialog() {
      // Navigator.of(context).push(PageRouteBuilder(
      //     opaque: true,
      //     pageBuilder: (BuildContext context, _, __) {
      //       return WorkoutDialog();
      //     }));

      Navigator.of(context).push(MaterialPageRoute<Null>(
          builder: (BuildContext context) {
            // return new WorkoutDialog();
            return WorkoutDialog();
          },
          fullscreenDialog: true));
    }

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
                        // showModalBottomSheet(
                        //     context: context,
                        //     builder: (context) {
                        //       // return Column(children: <Widget>[Text('test')],);
                        //       return Container(child: Text('hiiii'), height: 800.0);
                        //     })
                        print('play'),
                        _openWorkoutDialog(),
                      },
                  icon: Icon(Icons.play_arrow),
                  label: Text('PLAY', style: TextStyle(fontSize: 20.0)),
                  backgroundColor: Colors.blue,
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
