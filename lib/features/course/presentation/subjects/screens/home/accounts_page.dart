import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:padavukal/features/auth/presentation/bloc/auth_bloc.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(BlocProvider.of<AuthBloc>(context)
              .authRepo
              .getCurrentUser()
              .displayName),
          RaisedButton.icon(
            onPressed: () =>
                BlocProvider.of<AuthBloc>(context).add(LogOutEvent()),
            icon: Icon(Icons.logout),
            label: Text("Log Out"),
          ),
        ],
      ),
    );
  }
}
