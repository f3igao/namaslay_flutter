import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class PosePage extends StatelessWidget {
  final Map<dynamic, dynamic> pose;
  PosePage({this.pose});
  final String mockBenefit =
      'A challenging balance that incorporates hip opening, core and back strengthening, and hamstring lengthening';
  final String mockInstructions = '''
  1. Straighten your legs
  2. Lift up your arms
  3. Gaze forward
  ''';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Column(children: [
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        child: Hero(
                          tag: "$pose['id']",
                          child: SizedBox(
                              width: (MediaQuery.of(context).size.width),
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: pose['imageUrl'],
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16.0),
                        child: Text('Benefit'.toUpperCase(),
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple)),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 20.0),
                        child: Text(mockBenefit, style: TextStyle(fontSize: 16.0, color: Colors.black87)),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 16.0),
                          child: Text('Instructions'.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple))),
                      Container(
                          margin: EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 20.0),
                          child: Text(mockInstructions, style: TextStyle(fontSize: 16.0, color: Colors.black87)))
                    ],
                  ),
                )
              ]),
              Container(
                  margin: EdgeInsets.only(top: 50.0),
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: <Widget>[
                      Text(pose['name'],
                          style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54)),
                      Text(pose['sanskrit'],
                          style: TextStyle(color: Colors.purple))
                    ],
                  )),
              // cancel icon
              Positioned(
                  left: 0.0,
                  top: 0.0,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black54),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )),
            ],
          ),
        ));
  }
}
