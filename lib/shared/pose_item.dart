import 'package:flutter/material.dart';

class PoseItem extends StatefulWidget {
  final Map<dynamic, dynamic> pose;
  final Function activatePose;
  final String currentPoseId;
  final int index;
  PoseItem({this.pose, this.activatePose, this.currentPoseId, this.index});

  @override
  State<StatefulWidget> createState() {
    return _PoseBarState();
  }
}

class _PoseBarState extends State<PoseItem> {
  @override
  build(BuildContext context) {
    // bool _isPoseActive = widget.currentPoseId == widget.pose['id'];
    bool _isPoseActive = false;
    return FlatButton(
        onPressed: () {
          widget.activatePose(widget.index);
          setState(() {
            _isPoseActive = widget.currentPoseId == widget.pose['id'];
            // _isPoseActive = !_isPoseActive;
          });
        },
        child: Text(widget.pose['name'],
            style: _isPoseActive ? TextStyle(fontWeight: FontWeight.bold) : TextStyle(fontWeight: FontWeight.normal)));
  }
}
