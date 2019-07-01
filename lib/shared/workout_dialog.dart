import 'package:flutter/material.dart';

class WorkoutDialog extends StatefulWidget {
  @override
  WorkoutDialogState createState() => WorkoutDialogState();
}

class WorkoutDialogState extends State<WorkoutDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        // go back
        Positioned(
            left: 0.0,
            top: 0.0,
            child: SafeArea(
                child: IconButton(
              icon: Icon(Icons.close, color: Colors.black54),
              onPressed: () {
                Navigator.pop(context);
              },
            ))),
      ],
    )
        // appBar: AppBar(
        //   // backgroundColor: Colors.white,
        //   // elevation: 0.0,
        //   // title: const Text('entry'),
        //   actions: [
        //     IconButton(
        //       icon: Icon(Icons.arrow_back, color: Colors.white),
        //       onPressed: () {
        //         Navigator.pop(context);
        //       },
        //     )
        //   ],
        // ),
        // body: Text("test"),
        );
  }
}
