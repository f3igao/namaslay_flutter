import 'package:flutter/material.dart';
import 'package:namaslay_flutter/model/poses_data.dart';
import 'package:namaslay_flutter/pages/pose_page.dart';
import 'package:transparent_image/transparent_image.dart';
import '../filters.dart';

class PosesCollection extends StatelessWidget {
  const PosesCollection({Key key, this.filter}) : super(key: key);

  final Filter filter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: posesCollection(context),
    );
  }
}

Widget posesCollection(BuildContext context) {
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
            // final poseName = poses[index]['name'];
            final pose = poses[index];
            return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PosePage(pose: pose)));
                },
                child: Stack(children: [
                  Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Hero(
                          tag: "$pose['id']",
                          child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: pose['imageUrl'],
                              fit: BoxFit.cover),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10.0,
                                offset: Offset(2.0, 6.0))
                          ])),
                  Positioned(
                    child: Text(pose['name']),
                    left: 5.0,
                    top: 5.0,
                  )
                ]));
          },
          childCount: poses.length,
        ),
      ),
    ],
  );
}
