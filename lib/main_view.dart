
import 'package:flutter/material.dart';

import 'filters.dart';
import 'flow_container.dart';

class MainView extends StatelessWidget {
  const MainView({Key key, this.filter}) : super(key: key);

  final Filter filter;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(              
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[FlowContainer()],
      ),
    );
  }
}
