import 'package:flutter/material.dart';
import 'package:padavukal/core/errors/error.dart';

class ErrorsWidget extends StatelessWidget {
  final Errors errors;
  final Function retryFn;

  const ErrorsWidget({
    Key key,
    @required this.errors,
    @required this.retryFn,
  }) : super(key: key);

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
        RaisedButton.icon(
          onPressed: retryFn,
          icon: Icon(Icons.restore),
          label: Text('retry'),
        ),
      ],
    );
  }
}
