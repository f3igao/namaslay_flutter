import 'package:flutter/material.dart';
import 'package:namaslay_flutter/model/poses_data.dart';
import 'package:namaslay_flutter/shared/pose_bar.dart';

class PosesList extends StatefulWidget {
  final List<dynamic> sequence;
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
          var targetPose = poses.firstWhere(
              (pose) => pose['id'] == widget.sequence[index],
              orElse: () => print('Error, pose not found.'));
          return Container(
            child: PoseBar(pose: targetPose),
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
}
