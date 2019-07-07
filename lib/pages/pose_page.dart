import 'package:flutter/material.dart';

class PosePage extends StatelessWidget {
  // final String pose;
  Map<dynamic, dynamic> pose;
  PosePage({this.pose});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(poseName),
      // ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        color: Colors.lightBlueAccent,
        child: Hero(
          tag: "$pose['id']",
          child: SizedBox(
            width: 100.0,
            child: Image.asset(
              'images/eneko-urunuela-646064-unsplash',
            ),
          ),
        ),
      ),
    );
  }
}
