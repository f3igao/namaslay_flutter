import 'package:flutter/material.dart';

class Countdown extends AnimatedWidget {
  Countdown({Key key, this.animation}) : super(key: key, listenable: animation);
  Animation<int> animation;

  @override
  build(BuildContext context) {
    return AnimatedOpacity(
        opacity: animation.value == 0 ? 0.0 : 1.0,
        duration: Duration(seconds: 2),
        child: Center(
            child: Text(
          animation.value.toString(),
          style: TextStyle(fontSize: 150.0, color: Colors.black54),
        )));
  }
}
