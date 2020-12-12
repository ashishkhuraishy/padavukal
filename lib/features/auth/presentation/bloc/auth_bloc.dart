import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import '../../domain/repositories/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;
  final Logger _log = Logger();

  StreamSubscription<User> _userStream;

  AuthBloc({
    @required this.authRepo,
  }) : super(AuthInitial()) {
    _log.d("Initialised Auth Stream");
    _userStream = authRepo.authState.listen((user) => _mapUserToEvent(user));
  }

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    _log.d(event);
    if (event is LogInEvent) {
      await authRepo.signInWithGoogle();
    } else if (event is LogOutEvent) {
      _log.d("Log Out called");
      await authRepo.logOut();
      yield LoggedOut();
    } else if (event is AuthenticatedEvent) {
      _log.i(event.user);
      yield LoggedIn(user: event.user);
    } else if (event is UnAuthenticatedEvent) {
      yield LoggedOut();
    }
  }

  _mapUserToEvent(User user) {
    if (user != null)
      this.add(AuthenticatedEvent(user: user));
    else
      this.add(UnAuthenticatedEvent());
  }

  @override
  Future<void> close() {
    _userStream?.cancel();
    return super.close();
  }
}
