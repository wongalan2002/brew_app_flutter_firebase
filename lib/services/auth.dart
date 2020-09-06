import 'package:brew_app_flutter_firebase/model/User.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FirebaseUser

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map((FirebaseUser user) => _userFromFirebaseUser(user));
  }

  //sign in anon
  Future singInAnon() async {
    try {
      AuthResult results = await _auth.signInAnonymously();
      FirebaseUser user = results.user;

      // print(user);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  //sign in with email pass
  Future signInWithEmailPassword({String email, String password}) async {
    try {
      AuthResult results = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = results.user;

      // print(user);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  //register with email and pass

  Future registerWithEmailPassword({String email, String password}) async {
    try {
      AuthResult results = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = results.user;

      // print(user);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  //sign out

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
