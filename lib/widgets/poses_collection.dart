import 'package:flutter/material.dart';
import 'package:namaslay_flutter/model/poses_data.dart';
import 'package:namaslay_flutter/screens/pose_page.dart';
import 'cached_image.dart';

class PosesCollection extends StatelessWidget {
  const PosesCollection({Key key, this.filter}) : super(key: key);

  final String filter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: posesCollection(context, filter),
    );
  }
}

Widget posesCollection(BuildContext context, String filter) {
  bool filterPoses(tags) {
    if (filter == 'All') {
      return true;
    } else if (tags != null) {
      return tags.contains(filter.toLowerCase());
    } else {
      return false;
    }
  }

  List<dynamic> filteredPoses =
      poses.where((pose) => filterPoses(pose['tags'])).toList();

  return CustomScrollView(
    slivers: <Widget>[
      SliverGrid(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 15.0,
          crossAxisSpacing: 0.0,
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
                child: Stack(children: <Widget>[
                  Container(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Hero(
                            tag: "$pose['id']",
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
                    child: Container(
                      child: Text(pose['name']),
                      width: MediaQuery.of(context).size.width / 3,
                    ),
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
