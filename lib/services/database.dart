import "package:cloud_firestore/cloud_firestore.dart";

class DatabseService {
  // collection reference

  final String uid;

  final CollectionReference brewCollection =
      Firestore.instance.collection("brews");

  DatabseService({this.uid});

  Future updateUserData(String sugar, String name, int strength) async {
    return await brewCollection.document(uid).setData({
      "sugar": sugar,
      "name": name,
      "strength": strength,
    });
  }

  Stream<QuerySnapshot> get brews {
    return brewCollection.snapshots();
  }
}
