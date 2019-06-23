import 'package:flutter/material.dart';

class PoseBar extends StatefulWidget {
  final Map<dynamic, dynamic> pose;
  PoseBar({this.pose});

  @override
  State<StatefulWidget> createState() {
    return _PoseBarState();
  }
}

class _PoseBarState extends State<PoseBar> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: () {
          print('pressed ' + widget.pose['name']);
        },
        child: Text(widget.pose['name']));
  }
}
