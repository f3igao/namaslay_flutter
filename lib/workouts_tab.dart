import 'package:flutter/material.dart';

import 'flow_container.dart';
import 'flows.dart';

class WorkoutsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: choices.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Workouts',
            style: TextStyle(color: Colors.black87),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: TabBar(
            isScrollable: true,
            tabs: choices.map((Choice choice) {
              return Tab(text: choice.title);
            }).toList(),
            labelColor: Colors.black87,
            unselectedLabelColor: Colors.black26,
          ),
        ),
        body: TabBarView(
          children: choices.map((Choice choice) {
            // return Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: ChoiceCard(choice: choice),
            // );
            return ChoiceCard(choice: choice);
          }).toList(),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title});
  final String title;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'All'),
  const Choice(title: 'Favorites'),
  const Choice(title: 'Recommended'),
  const Choice(title: 'Uplift'),
  const Choice(title: 'Relax'),
  const Choice(title: 'Summer'),
  const Choice(title: 'Stress'),
  const Choice(title: 'Detox'),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.grey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[FlowContainer()],
      ),
    );
  }
}
