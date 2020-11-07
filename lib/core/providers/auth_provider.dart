import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

class AuthProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Logger _logger = Logger();

  Future<User> get user async => _auth.currentUser;

  Stream<User> get userAuthState => _auth.authStateChanges();

  signInWIthGoogle() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;

    GoogleAuthCredential googleAuthCredential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    var creds = await _auth.signInWithCredential(googleAuthCredential);
    if (creds.additionalUserInfo.isNewUser) {
      //Do something if its a new user
    }
  }

  logout() async {
    _logger.w("Sign out is being called");
    await _auth.signOut();
  }
}
