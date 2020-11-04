import 'package:flutter/material.dart';
import 'package:padavukal/core/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: Center(
        child: RaisedButton.icon(
          onPressed: () async {
            await _authProvider.signInWIthGoogle();
          },
          icon: Icon(Icons.login),
          label: Text("login"),
        ),
      ),
    );
  }
}
