import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

import '../../domain/repositories/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final Logger _log;

  AuthRepoImpl({
    Logger logger,
    this.firebaseAuth,
    this.googleSignIn,
  }) : _log = logger;

  @override
  Future<void> logOut() async {
    _log.d("Signed Out");
    await firebaseAuth.signOut();
  }

  @override
  Future<User> signInWithGoogle() async {
    try {
      GoogleSignInAccount _googleUser = await googleSignIn.signIn();
      GoogleSignInAuthentication _auth = await _googleUser.authentication;

      GoogleAuthCredential _credential = GoogleAuthProvider.credential(
        accessToken: _auth.accessToken,
        idToken: _auth.idToken,
      );

      var res = await firebaseAuth.signInWithCredential(_credential);
      _log.d(res.user);
      return res.user;
    } catch (e) {
      _log.e(e.toString());
      return null;
    }
  }

  @override
  Stream<User> get authState => firebaseAuth.authStateChanges();

  @override
  User getCurrentUser() {
    return firebaseAuth.currentUser;
  }
}
