import 'package:flutter/material.dart';
import 'package:namaslay_flutter/model/poses_data.dart';

Widget posesList(BuildContext context, List<dynamic> sequence) {
  return SliverGrid(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 1,
      childAspectRatio: 5.5,
    ),
    delegate: SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return Container(
          child: poseBar(sequence[index]),
          decoration: BoxDecoration(
            color: Colors.black12,
            border: Border.all(width: 1.0, color: Colors.white),
          ),
        );
      },
      childCount: sequence.length,
    ),
  );
}

Widget poseBar(String id) {
  var target = poses.firstWhere((pose) => pose['id'] == id,
      orElse: () => print('Error, pose not found.'));
  return FlatButton(
      onPressed: () {
        print('pressed ' + target['name']);
      },
      child: Text(target['name']));
}
