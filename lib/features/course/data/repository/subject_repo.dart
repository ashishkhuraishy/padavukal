import 'package:dartz/dartz.dart';
import 'package:padavukal/core/errors/error.dart';
import 'package:padavukal/features/course/data/data_source/subject_remote.dart';
import 'package:padavukal/features/course/domain/entity/chapter.dart';
import 'package:padavukal/features/course/domain/entity/subject.dart';
import 'package:padavukal/features/course/domain/repositories/subject_repo.dart';

class SubjectRepoImpl extends SubjectRepo {
  final SubjectRemote subjectRemote;

  SubjectRepoImpl({this.subjectRemote});

  @override
  Future<Either<Errors, List<Subject>>> getHomePage() {
    return subjectRemote.getHomePage();
  }

  @override
  Future<Either<Errors, List<Chapter>>> getChapters(int id) {
    return subjectRemote.getChapters(id);
  }
}
