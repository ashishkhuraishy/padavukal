part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LogInEvent extends AuthEvent {}

class LogOutEvent extends AuthEvent {}

class AuthenticatedEvent extends AuthEvent {
  final User user;

  AuthenticatedEvent({this.user});
}

class UnAuthenticatedEvent extends AuthEvent {}
