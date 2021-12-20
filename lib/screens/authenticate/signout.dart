import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class SignOut extends StatefulWidget {
  @override
  _SignOutState createState() => _SignOutState();
}

class _SignOutState extends State<SignOut> {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign in to Brew Crew"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 50.0,
        ),
        child: RaisedButton(
          onPressed: () async {
            dynamic result = await _auth.signOut();

            if (result != null)
              print("Could not sign out");
            else {
              print("Signed Out");
              print(result);
            }
          },
          child: Text("Sign in Anon"),
        ),
      ),
    );
  }
}
