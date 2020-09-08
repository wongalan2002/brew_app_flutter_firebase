import 'package:brew_app_flutter_firebase/model/Brew.dart';
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

  // brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Brew(
        name: doc.data["name"] ?? "",
        strength: doc.data["strength"] ?? "",
        sugars: doc.data["sugar"] ?? 0,
      );
    }).toList();
  }

  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }
}
