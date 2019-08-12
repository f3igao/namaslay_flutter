import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:namaslay_flutter/util/model_helpers.dart';

List<dynamic> poses = [];
List<String> poseFilters = ['All'];

Future fetchPosesData() async {
  var getPoses = Firestore.instance.collection('poses').getDocuments();
  await getPoses.then((payload) {
    payload.documents.forEach((pose) {
      poses.add(pose.data);

      // add tags per each pose
      if (pose.data.containsKey('tags') && pose.data['tags'].length > 0) {
        pose.data['tags'].forEach((tag) {
          String currentFilter = buildTitle(tag.toString());
          if (!poseFilters.contains(currentFilter)) {
            poseFilters.add(currentFilter);
          }
        });
      }
    });
  });
}
