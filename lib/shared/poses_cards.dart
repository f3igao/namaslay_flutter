import 'package:flutter/material.dart';
import 'package:namaslay_flutter/model/poses_data.dart';
import 'package:namaslay_flutter/pages/pose_page.dart';
import '../filters.dart';

class PosesCards extends StatelessWidget {
  const PosesCards({Key key, this.filter}) : super(key: key);

  final Filter filter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: posesCards(context),
    );
  }
}
Widget posesCards(BuildContext context) {
  return CustomScrollView(
    slivers: <Widget>[
      SliverGrid(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 20.0,
          childAspectRatio: 1.1,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            final poseName = poses[index]['name'];
            return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PosePage(poseName: poseName)));
                },
                child: Container(
                    child: Center(child: Text(poseName)),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10.0,
                              offset: Offset(2.0, 6.0))
                        ])));
          },
          childCount: poses.length,
        ),
      ),
    ],
  );
}
