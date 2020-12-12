import 'package:dartz/dartz.dart';

import '../../../../core/config/use_case_config.dart';
import '../../../../core/errors/error.dart';
import '../entity/course.dart';
import '../repositories/course_repo.dart';

class SubscribeCourse extends UseCase<Course, IdParams> {
  final CourseRepo courseRepo;

  SubscribeCourse({this.courseRepo});

  @override
  Future<Either<Errors, Course>> call({IdParams params}) {
    return courseRepo.getCourseById(params.id);
  }
}
