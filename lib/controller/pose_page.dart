import 'package:flutter/material.dart';
import 'package:namaslay_flutter/view/cached_image.dart';
import 'package:namaslay_flutter/view/pose_header.dart';

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
        body: Stack(
          children: <Widget>[
            CustomScrollView(
              slivers: <Widget>[
                SliverPersistentHeader(
                  pinned: true,
                  delegate: PoseHeader(
                    minExtent: (MediaQuery.of(context).size.height) / 6,
                    maxExtent: (MediaQuery.of(context).size.height) / 5,
                    poseName: pose['name'],
                    poseSanskrit: pose['sanskrit'],
                  ),
                ),
                SliverList(
                    delegate: SliverChildListDelegate(
                  [
                    Container(
                      child: Hero(
                        tag: "$pose['id']",
                        child: SizedBox(
                          height: (MediaQuery.of(context).size.height) / 2,
                          child: CachedImage(
                              url: pose['imageUrl'], showLoader: true),
                        ),
                      ),
                      margin: EdgeInsets.only(bottom: 50.0),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                      child: Text('Benefit'.toUpperCase(),
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple)),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 20.0),
                      child: Text(mockBenefit,
                          style:
                              TextStyle(fontSize: 16.0, color: Colors.black87)),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 4.0),
                        child: Text('Instructions'.toUpperCase(),
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple))),
                    Container(
                        margin: EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 20.0),
                        child: Text(mockInstructions,
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.black87))),
                  ],
                )),
              ],
            ),
          ],
        ));
  }
}
