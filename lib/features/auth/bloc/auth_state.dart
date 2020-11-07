part of 'auth_bloc.dart';

enum AuthStatus { unknown, authencticated, unAuthencticated }

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class LoggedIn extends AuthState {
  final User user;

  LoggedIn({this.user});
}

class LoggedOut extends AuthState {}
