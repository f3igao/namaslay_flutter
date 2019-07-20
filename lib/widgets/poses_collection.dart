import 'package:flutter/material.dart';
import 'package:namaslay_flutter/model/poses_data.dart';
import 'package:namaslay_flutter/screens/pose_page.dart';

import 'cached_image.dart';

class PosesCollection extends StatelessWidget {
  const PosesCollection({Key key, this.filter}) : super(key: key);

  final Filter filter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: posesCollection(context, filter),
    );
  }
}

Widget posesCollection(BuildContext context, Filter filter) {
  filterPoses(tags) {
    if (filter.title == 'All') return true;
    return tags.contains(filter.title.toLowerCase());
  }

  List<dynamic> filteredPoses =
      poses.where((pose) => filterPoses(pose['tags'])).toList();

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
            final pose = filteredPoses[index];
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
                            // child: Image.network(pose['imageUrl'],
                            //     fit: BoxFit.cover),)

                            child: CachedImage(
                                url: pose['imageUrl'], showLoader: true),
                          )),
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
          childCount: filteredPoses.length,
        ),
      ),
    ],
  );
}
