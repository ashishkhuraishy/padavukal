import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:padavukal/features/auth/presentation/bloc/auth_bloc.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton.icon(
          onPressed: () => BlocProvider.of<AuthBloc>(context).add(LogInEvent()),
          icon: Icon(Icons.login),
          label: Text("login"),
        ),
      ),
    );
  }
}
