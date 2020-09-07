import 'package:brew_app_flutter_firebase/services/auth.dart';
import 'package:brew_app_flutter_firebase/shared/constants.dart';
import "package:flutter/material.dart";

class SignIn extends StatefulWidget {
  final VoidCallback toggleView;

  const SignIn({
    Key key,
    this.toggleView,
  }) : super(key: key);
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  String email = "";
  String password = "";

  final _signinFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign in to Brew Crew"),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: widget.toggleView,
            icon: Icon(Icons.person),
            label: Text("Register"),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 50.0,
        ),
        child: Form(
          key: _signinFormKey,
          child: Column(children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: "Email"),
              validator: (value) => value.isEmpty ? "Enter an Email" : null,
              onChanged: (val) {
                setState(() {
                  email = val;
                });
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: "Password"),
              validator: (value) => value.length < 6
                  ? "Enter password longer than 6 chars"
                  : null,
              obscureText: true,
              onChanged: (val) {
                setState(() {
                  password = val;
                });
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              color: Colors.pink[400],
              child: Text(
                "Sign in",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () async {
                if (_signinFormKey.currentState.validate()) {
                  await _auth.signInWithEmailPassword(
                    email: email,
                    password: password,
                  );
                }
              },
            ),
            // Text("Email: ${email}\nPassword: ${password}")
          ]),
        ),
      ),
    );
  }
}
