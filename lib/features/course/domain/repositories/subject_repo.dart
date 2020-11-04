import 'package:dartz/dartz.dart';
import 'package:padavukal/core/errors/error.dart';
import 'package:padavukal/features/course/domain/entity/subject.dart';

abstract class SubjectRepo {
  Future<Either<Errors, List<Subject>>> getHomePage();
}
