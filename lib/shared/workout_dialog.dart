import 'package:flutter/material.dart';

class WorkoutDialog extends StatefulWidget {
  @override
  WorkoutDialogState createState() => new WorkoutDialogState();
}

class WorkoutDialogState extends State<WorkoutDialog> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('New entry'),
        actions: [
          new FlatButton(
              onPressed: () {
                // Navigator.of(context).pop(new WeightSave(
                //     new DateTime.now(), new Random().nextInt(100).toDouble()));
                Navigator.of(context).pop();
              },
              child: new Text('SAVE',
                  style: Theme.of(context)
                      .textTheme
                      .subhead
                      .copyWith(color: Colors.white))),
        ],
      ),
      body: new Text("Foo"),
    );
  }
}
