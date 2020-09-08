import 'package:brew_app_flutter_firebase/model/Brew.dart';
import 'package:brew_app_flutter_firebase/screens/home/brew_tile.dart';
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context);
    // print(brews.documents);
    brews.forEach((brew) {
      print(brew.name);
      print(brew.sugars);
      print(brew.strength.toString());
    });
    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context, index) {
        return BrewTile(brew: brews[index]);
      },
    );
  }
}
