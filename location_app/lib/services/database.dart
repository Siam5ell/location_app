import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  final CollectionReference locations =
      FirebaseFirestore.instance.collection("Location");
  Future updatelocation(double latitude, double longitude) async {
    return await locations
        .doc(uid)
        .set({"latitude": latitude, "longitude": longitude});
  }

  Stream<DocumentSnapshot> get locationstream {
    return locations.doc(uid).snapshots();
  }
}
