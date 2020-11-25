import 'package:equatable/equatable.dart';
import 'package:padavukal/core/errors/error.dart';

abstract class BlocState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadingState extends BlocState {}

class ErrorState extends BlocState {
  final Errors err;

  ErrorState({
    this.err,
  });

  @override
  List<Object> get props => [err];
}
