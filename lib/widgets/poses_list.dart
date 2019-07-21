import 'package:flutter/material.dart';
import 'package:namaslay_flutter/model/poses_data.dart';
import 'package:namaslay_flutter/screens/pose_page.dart';

class PosesList extends StatefulWidget {
  final List<dynamic> sequence;

  PosesList({this.sequence});

  @override
  State<StatefulWidget> createState() => _PosesListState();
}

class _PosesListState extends State<PosesList> {
  Map<dynamic, dynamic> _getPose(int index) {
    return poses.firstWhere((pose) => pose['id'] == widget.sequence[index],
        orElse: () => print('Error, pose not found.'));
  }

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 5.5,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          Map<dynamic, dynamic> pose = _getPose(index);
          return Container(
            child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PosePage(pose: pose)));
                },
                child: Text(pose['name'],
                    style: TextStyle(
                      fontSize: 16,
                    ))),
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
