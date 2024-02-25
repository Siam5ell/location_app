import "package:firebase_auth/firebase_auth.dart";

class Authenticate {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  Future<User?> registerwithemailandpassword(
      String email, String password) async {
    try {
      UserCredential usercred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return usercred.user;
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> signinwithemailandpassword(
      String email, String password) async {
    try {
      UserCredential usercred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return usercred.user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
