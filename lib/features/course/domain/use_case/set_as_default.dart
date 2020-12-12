import 'package:dartz/dartz.dart';

import '../../../../core/config/use_case_config.dart';
import '../../../../core/errors/error.dart';
import '../entity/course.dart';
import '../repositories/course_repo.dart';

class SetAsDefault extends UseCase<Course, IdParams> {
  final CourseRepo courseRepo;

  SetAsDefault({this.courseRepo});

  @override
  Future<Either<Errors, Course>> call({IdParams params}) {
    return courseRepo.getCourseById(params.id);
  }
}
