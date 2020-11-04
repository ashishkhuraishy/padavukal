import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

class UserController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Rx<User> _firebaseUser = Rx<User>();
  RxBool _isNewUser = false.obs;

  Logger _logger = Logger();

  User get user => _firebaseUser.value;
  Future<String> get token async => user.getIdToken();

  @override
  void onInit() {
    // _firebaseUser.value = _auth.currentUser;
    _firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

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
      _isNewUser.value = true;
    }
  }

  logout() {
    _logger.w("Sign out is being called");
    _auth.signOut();
  }
}
