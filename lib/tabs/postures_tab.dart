import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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

class PosturesTab extends StatelessWidget {
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
            return PosturesContainer(filter: filter);
          }).toList(),
        ),
      ),
    );
  }
}

class Filter {
  const Filter({this.title});
  final String title;
}

const List<Filter> filters = const <Filter>[
  const Filter(title: 'All'),
  const Filter(title: 'Recommended'),
  const Filter(title: 'Lower Back'),
  const Filter(title: 'Arms'),
  const Filter(title: 'Legs'),
  const Filter(title: 'Core'),
  const Filter(title: 'Shoulders'),
  const Filter(title: 'Neck'),
];

class PosturesContainer extends StatelessWidget {
  const PosturesContainer({Key key, this.filter}) : super(key: key);
  final Filter filter;
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Container(
      margin: EdgeInsets.only(left: 8.0, right: 8.0),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
            itemBuilder: _buildPosturesRow,
            itemCount: mockPostures.length,
          ))
        ],
      ),
    );
  }
}

Widget _buildPosturesRow(BuildContext context, int index) {
  final TextStyle textStyle = Theme.of(context).textTheme.display1;
  return Row(children: [
    Expanded(
        child: Container(
      child: Center(child: Text('test', style: textStyle)),
      // child: Center(child: Text('test')),
      height: 170.0,
      margin: EdgeInsets.all(8.0),
      decoration: new BoxDecoration(
        color: Colors.amber,
        borderRadius: new BorderRadius.all(new Radius.circular(16.0)),
      ),
    )),
    Expanded(
      child: Container(
        child: Center(child: Text('test', style: textStyle)),
        // child: Center(child: Text('test')),
        height: 170.0,
        margin: EdgeInsets.all(8.0),
        decoration: new BoxDecoration(
          color: Colors.amber,
          borderRadius: new BorderRadius.all(new Radius.circular(16.0)),
        ),
      ),
    )
  ]);
}
