import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> register(String email, String password, String username) async {
    try {
      // Create user in Firebase Auth only
      UserCredential credential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = credential.user;

      // Optionally update displayName so you still have a username
      await user?.updateDisplayName(username);

      return user;

    } on FirebaseAuthException catch (e) {
      print('Registration Error: ${e.message}');
      return null;
    }
  }

  Future<User?> login(String email, String password) async {
    try {
      UserCredential credential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      print('Login Error: ${e.message}');
      return null;
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Logout Error: $e');
    }
  }

  Future<void> deleteUser() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.delete();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        print('You need to re-login before deleting your account.');
      } else {
        print('Delete Error: ${e.message}');
      }
    }
  }
}
