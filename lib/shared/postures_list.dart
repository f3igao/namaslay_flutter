import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:namaslay_flutter/pages/posture_page.dart';
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
            final postureName = postures[index].data['name'];
            return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PosturePage(postureName)));
                },
                child: Container(
                    child: Center(child: Text(postureName)),
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
          childCount: postures.length,
        ),
      ),
    ],
  );
}