import 'package:cloud_firestore/cloud_firestore.dart';

List<dynamic> postures = [];
Future fetchPosturesData() async {
  var getPostures = Firestore.instance.collection('poses').getDocuments();
  await getPostures.then((paylod) {
    paylod.documents.forEach((posture) {
      postures.add(posture.data);
    });
  });
}