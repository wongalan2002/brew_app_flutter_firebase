import 'package:brew_app_flutter_firebase/screens/authenticate/register.dart';
import 'package:brew_app_flutter_firebase/screens/authenticate/signin.dart';

import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: showSignIn
          ? SignIn(
              toggleView: toggleView,
            )
          : Register(
              toggleView: toggleView,
            ),
    );
  }
}
