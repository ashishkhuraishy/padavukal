import 'package:flutter/material.dart';
import 'package:padavukal/core/errors/error.dart';

class ErrorsWidget extends StatelessWidget {
  final Errors errors;

  const ErrorsWidget({Key key, this.errors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(errors.message),
        ),
        Center(
          child: Text(errors.statusCode),
        ),
      ],
    );
  }
}
