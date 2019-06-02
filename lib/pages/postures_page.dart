import 'package:flutter/material.dart';
import 'package:namaslay_flutter/shared/postures_list.dart';
import '../filters.dart';

List<String> mockPostures = [
  "Big Toe Pose",
  "Boat Pose",
  "Bound Angle Pose",
  "Bow Pose",
  "Bridge Pose",
  "Camel Pose",
  "Cat Pose",
  "Cow Pose",
  "Crane Pose",
];

class PosturesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: filters.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Posture Clinic",
            style: TextStyle(color: Colors.black87),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.blueAccent,
            tabs: filters.map((Filter filter) {
              return Tab(text: filter.title);
            }).toList(),
            labelColor: Colors.black87,
            unselectedLabelColor: Colors.black26,
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: filters.map((Filter filter) {
            // return PosturesContainer(filter: filter);
            return PosturesList(filter: filter);
          }).toList(),
        ),
      ),
    );
  }
}

class PosturesContainer extends StatelessWidget {
  const PosturesContainer({Key key, this.filter}) : super(key: key);
  final Filter filter;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(8.0),
        color: Colors.white,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                      child: Center(child: Text('test')),
                      height: 170.0,
                      margin: EdgeInsets.all(8.0),
                      decoration: new BoxDecoration(
                        color: Colors.amber,
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(16.0)),
                      ));
                },
                childCount: 20,
              ),
            ),
          ],
        ));
  }
}
