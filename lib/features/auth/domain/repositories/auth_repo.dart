import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  Future<User> signInWithGoogle();
  User getCurrentUser();
  Stream<User> get authState;

  Future<void> logOut();
}
