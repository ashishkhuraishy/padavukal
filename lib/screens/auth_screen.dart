import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padavukal/core/controllers/user_controller.dart';

class AuthScreen extends StatelessWidget {
  final UserController _userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton.icon(
          onPressed: () async {
            await _userController.signInWIthGoogle();
          },
          icon: Icon(Icons.login),
          label: Text("login"),
        ),
      ),
    );
  }
}
