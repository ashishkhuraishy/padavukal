import 'package:dartz/dartz.dart';
import 'package:padavukal/core/errors/error.dart';
import 'package:padavukal/features/course/domain/entity/subject.dart';
import 'package:padavukal/features/course/domain/repositories/subject_repo.dart';

class SubjectRepoImpl extends SubjectRepo {
  @override
  Future<Either<Errors, List<Subject>>> getHomePage() {
    // TODO: implement getHomePage
    throw UnimplementedError();
  }
}
