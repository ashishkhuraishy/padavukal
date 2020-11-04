import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padavukal/core/controllers/user_controller.dart';

class Home extends StatelessWidget {
  final UserController _userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Welcome ${_userController.user.displayName}")),
          SizedBox(
            height: 25,
          ),
          RaisedButton.icon(
            onPressed: () async {
              String token = await _userController.token;
              log(token);
            },
            icon: Icon(Icons.security_outlined),
            label: Text("Get Token"),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _userController.logout();
        },
        child: Icon(Icons.logout),
      ),
    );
  }
}
