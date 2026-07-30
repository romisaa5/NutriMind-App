import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth;

  FirebaseAuthService(this._auth);

  User? get currentUser => _auth.currentUser;

  bool get isLoggedIn => currentUser != null;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<UserCredential> login({
    required String email,
    required String password,
  }) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> register({
    required String email,
    required String password,
  }) {
    return _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> logout() {
    return _auth.signOut();
  }

  Future<void> sendResetPassword(String email) {
    return _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> verifyEmail() async {
    await currentUser?.sendEmailVerification();
  }

  Future<void> reloadUser() async {
    await currentUser?.reload();
  }

  Future<void> deleteAccount() async {
    await currentUser?.delete();
  }
}
