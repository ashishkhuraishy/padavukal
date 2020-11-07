import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:padavukal/features/auth/bloc/auth_bloc.dart';
import 'package:padavukal/screens/auth/auth_screen.dart';
import 'package:padavukal/screens/home.dart';
import 'package:padavukal/widgets/loading.dart';

class Wrapper extends StatelessWidget {
  final Logger _log = Logger();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        _log.i(state);
        if (state is LoggedIn) {
          _log.i("Loggin in as ${state.user.displayName}");
          return Home(
            user: state.user,
          );
        } else if (state is LoggedOut) {
          _log.i("Signed Out");
          return AuthScreen();
        }
        return Scaffold(
          body: Loading(),
        );
      },
    );
  }
}
