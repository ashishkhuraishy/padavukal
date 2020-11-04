import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:padavukal/core/providers/auth_provider.dart';
import 'package:padavukal/screens/auth_screen.dart';
import 'package:padavukal/screens/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  final Logger _log = Logger();

  @override
  Widget build(BuildContext context) {
    final _authProvider = Provider.of<AuthProvider>(context, listen: false);

    return StreamBuilder<User>(
      stream: _authProvider.userAuthState,
      initialData: _authProvider.user,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          _log.i("Loggin in as ${snapshot.data.displayName}");
          return Home();
        }
        _log.i("Sign in to continue");
        return AuthScreen();
      },
    );
  }
}
