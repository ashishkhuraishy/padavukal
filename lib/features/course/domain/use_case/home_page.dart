import 'package:dartz/dartz.dart';
import 'package:padavukal/core/config/use_case_config.dart';
import 'package:padavukal/core/errors/error.dart';
import 'package:padavukal/features/course/domain/entity/subject.dart';
import 'package:padavukal/features/course/domain/repositories/subject_repo.dart';

class GetHomePage extends UseCase<List<Subject>, NoParams> {
  final SubjectRepo subjectRepo;

  GetHomePage({this.subjectRepo});

  @override
  Future<Either<Errors, List<Subject>>> call({NoParams params}) {
    return subjectRepo.getHomePage();
  }
}
