import 'package:dartz/dartz.dart';
import 'package:padavukal/core/errors/error.dart';

abstract class UseCase<T, Params> {
  Future<Either<Errors, T>> call({Params params});
}

abstract class Params {}

class NoParams extends Params {}

class IdParams extends Params {
  final int id;

  IdParams({this.id});
}
