import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Logger _logger = Logger();

  User get user => _auth.currentUser;
  Future<String> get token async => user.getIdToken();

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
    notifyListeners();
  }

  logout() {
    _logger.w("Sign out is being called");
    _auth.signOut();
    notifyListeners();
  }
}
