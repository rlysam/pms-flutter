import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:payrollsystem/features/login_page/data/models/user.dart';

class AuthenticationService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  User? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    } else {
      return User(user.uid, user.email);
    }
  }

  Stream<User?>? get user => _firebaseAuth.authStateChanges().map(_userFromFirebase);

  Future<String?> signInWithEmailAndPassword(
      String email, String password) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword( email: email, password: password);
    _userFromFirebase(credential.user);
  }

  /// This won't pop routes so you could do something like
  /// Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  /// after you called this method if you want to pop all routes.
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

}
