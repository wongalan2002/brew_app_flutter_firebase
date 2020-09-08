import 'package:brew_app_flutter_firebase/model/Brew.dart';
import 'package:brew_app_flutter_firebase/screens/home/brewlist.dart';
import 'package:brew_app_flutter_firebase/services/auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import '../../services/database.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void showSettingsPanel() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 60.0,
            ),
            child: Text("This is modal"),
          );
        },
      );
    }

    final AuthService _auth = AuthService();
    return StreamProvider<List<Brew>>.value(
      value: DatabseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text("Brew Crew"),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text("Logout"),
            ),
            FlatButton.icon(
              onPressed: () {
                showSettingsPanel();
              },
              icon: Icon(Icons.settings),
              label: Text("Settings"),
            ),
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
