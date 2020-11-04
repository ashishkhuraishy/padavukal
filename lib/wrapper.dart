import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:padavukal/core/controllers/user_controller.dart';
import 'package:padavukal/screens/auth_screen.dart';
import 'package:padavukal/screens/home.dart';

class Wrapper extends StatelessWidget {
  final UserController _userController = Get.find();
  final Logger _logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      _logger.i("Signed In as ${_userController.user?.displayName}");
      if (_userController.user == null)
        return AuthScreen();
      else
        return Home();
    });
  }
}
