import 'package:flutter/material.dart';
import 'package:padavukal/widgets/outline_button.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: deviceSize.height * 0.2),
            Image.asset(
              "assets/images/padavukal 1.png",
              scale: 1,
            ),
            SizedBox(height: deviceSize.height * 0.05),
            Center(
              child: OutLinedButton(
                title: "Sign in with Google",
                imageUrl: "assets/images/googleIcon.png",
                width: deviceSize.width * 0.234,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
