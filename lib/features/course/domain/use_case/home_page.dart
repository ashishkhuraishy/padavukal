import 'package:dartz/dartz.dart';

import '../../../../core/config/use_case_config.dart';
import '../../../../core/errors/error.dart';
import '../entity/subject.dart';
import '../repositories/subject_repo.dart';

class GetHomePage extends UseCase<List<Subject>, NoParams> {
  final SubjectRepo subjectRepo;

  GetHomePage({this.subjectRepo});

  @override
  Future<Either<Errors, List<Subject>>> call({NoParams params}) {
    return subjectRepo.getHomePage();
  }
}
