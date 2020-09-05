import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign in anon
  Future singInAnon() async {
    try {
      AuthResult results = await _auth.signInAnonymously();
      FirebaseUser user = results.user;
      print(user);
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  //sign in with email pass

  //register with email and pass

  //sign out
}
