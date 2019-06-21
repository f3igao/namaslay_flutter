import 'package:cloud_firestore/cloud_firestore.dart';

List<dynamic> poses = [];
Future fetchPosesData() async {
  var getPoses = Firestore.instance.collection('poses').getDocuments();
  await getPoses.then((paylod) {
    paylod.documents.forEach((pose) {
      poses.add(pose.data);
    });
  });
}