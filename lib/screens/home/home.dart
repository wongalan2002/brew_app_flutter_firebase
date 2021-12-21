import 'package:brew_crew/screens/home/settings_form.dart';
import 'package:brew_crew/services/database.dart';
import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/screens/home/brewlist.dart';
import 'package:brew_crew/services/auth.dart';
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
            color: Color(0xff757575),
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 40,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SettingsForm(),
            ),
          );
        },
      );
    }

    final AuthService _auth = AuthService();
    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      initialData: [],
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text("Brew Crew"),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            ElevatedButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text("Logout"),
            ),
            ElevatedButton.icon(
              onPressed: () {
                showSettingsPanel();
              },
              icon: Icon(Icons.settings),
              label: Text("Settings"),
            ),
          ],
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/coffee_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: BrewList()),
      ),
    );
  }
}
