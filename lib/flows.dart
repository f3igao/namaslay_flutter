import 'package:flutter/material.dart';

class Flows extends StatelessWidget {
  final List<String> flows;
  Flows([this.flows = const []]);

  Widget _buildFlowCard(BuildContext context, int index) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
        child: Column(
          children: <Widget>[
            Container(
              child: Center(child: Text(flows[index], style: textStyle)),
              height: 150,
            )
          ],
        ),
        color: Colors.amber,
        margin: EdgeInsets.all(15));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildFlowCard,
      itemCount: flows.length,
    );
  }
}
