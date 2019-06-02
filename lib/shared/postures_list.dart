import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../filters.dart';

class PosturesList extends StatelessWidget {
  const PosturesList({Key key, this.filter}) : super(key: key);

  final Filter filter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: _fetchPostures(context),
    );
  }
}

Widget _fetchPostures(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection('poses').snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return Container();
      return _buildPosturesList(context, snapshot.data.documents);
    },
  );
}

Widget _buildPosturesList(
    BuildContext context, List<DocumentSnapshot> postures) {
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
            return Container(
                child: Center(child: Text(postures[index].data['name'])),
                decoration: new BoxDecoration(
                  color: Colors.amber,
                  borderRadius: new BorderRadius.all(new Radius.circular(16.0)),
                ));
          },
          childCount: postures.length,
        ),
      ),
    ],
  );
}
