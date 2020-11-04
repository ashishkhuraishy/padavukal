import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:padavukal/core/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Welcome ${_authProvider.user.displayName}")),
          SizedBox(
            height: 25,
          ),
          RaisedButton.icon(
            onPressed: () async {
              String token = await _authProvider.token;
              log(token);
            },
            icon: Icon(Icons.security_outlined),
            label: Text("Get Token"),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _authProvider.logout();
        },
        child: Icon(Icons.logout),
      ),
    );
  }
}
