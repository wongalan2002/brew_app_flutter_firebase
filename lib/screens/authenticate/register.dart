import 'package:brew_app_flutter_firebase/services/auth.dart';
import 'package:brew_app_flutter_firebase/shared/constants.dart';
import 'package:brew_app_flutter_firebase/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final VoidCallback toggleView;

  const Register({Key key, this.toggleView}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  String email = "";
  String password = "";
  bool loading = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
                backgroundColor: Colors.brown[400],
                elevation: 0.0,
                title: Text("Register to Brew Crew"),
                actions: <Widget>[
                  FlatButton.icon(
                    onPressed: widget.toggleView,
                    icon: Icon(Icons.person),
                    label: Text("Sign in"),
                  )
                ]),
            body: Container(
              padding: EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 50.0,
              ),
              child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: "Email"),
                    validator: (value) {
                      return value.isEmpty ? "Enter an Email" : null;
                    },
                    onChanged: (val) {
                      setState(
                        () {
                          email = val;
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration:
                        textInputDecoration.copyWith(hintText: "Password"),
                    validator: (value) {
                      return value.length < 6
                          ? "Enter password longer than 6 char"
                          : null;
                    },
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
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          loading = true;
                        });
                        dynamic result = await _auth.registerWithEmailPassword(
                          email: email,
                          password: password,
                        );

                        if (result == null) {
                          setState(() {
                            loading = false;
                          });
                        }
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
