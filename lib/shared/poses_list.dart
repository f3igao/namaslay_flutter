import 'package:flutter/material.dart';
import 'package:namaslay_flutter/model/poses_data.dart';

class PosesList extends StatefulWidget {
  List<dynamic> sequence;
  PosesList({this.sequence});

  @override
  State<StatefulWidget> createState() {
    return _PosesListState();
  }
}

class _PosesListState extends State<PosesList> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 5.5,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            child: poseBar(widget.sequence[index]),
            decoration: BoxDecoration(
              color: Colors.black12,
              border: Border.all(width: 1.0, color: Colors.white),
            ),
          );
        },
        childCount: widget.sequence.length,
      ),
    );
  }

  Widget poseBar(String id) {
    var targetPose = poses.firstWhere((pose) => pose['id'] == id,
        orElse: () => print('Error, pose not found.'));
    return FlatButton(
        onPressed: () {
          // activatePose
          print('pressed ' + targetPose['name']);
        },
        child: Text(targetPose['name']));
  }
}
