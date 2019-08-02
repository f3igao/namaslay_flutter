import 'package:cloud_firestore/cloud_firestore.dart';

class Filter {
  const Filter({this.title});
  final String title;
}

String buildTitle(string) => '${string[0].toUpperCase()}${string.substring(1)}';

List<dynamic> poses = [];
List<Filter> poseFilters = [
  const Filter(title: 'All'),
];

Future fetchPosesData() async {
  var getPoses = Firestore.instance.collection('poses').getDocuments();
  await getPoses.then((payload) {
    payload.documents.forEach((pose) {
      poses.add(pose.data);
      if (pose.data['tags'].length > 0) {
        pose.data['tags'].forEach((tag) {
          poseFilters.add(Filter(title: buildTitle(tag.toString())));
        });
      }
    });
  });
}
