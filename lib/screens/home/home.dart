import 'package:brew_app_flutter_firebase/screens/home/brewlist.dart';
import 'package:brew_app_flutter_firebase/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../services/database.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return StreamProvider<QuerySnapshot>.value(
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
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
