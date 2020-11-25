import 'package:dartz/dartz.dart';
import 'package:padavukal/core/config/use_case_config.dart';
import 'package:padavukal/core/errors/error.dart';
import 'package:padavukal/features/course/domain/entity/course.dart';
import 'package:padavukal/features/course/domain/repositories/course_repo.dart';

class SetAsDefault extends UseCase<Course, IdParams> {
  final CourseRepo courseRepo;

  SetAsDefault({this.courseRepo});

  @override
  Future<Either<Errors, Course>> call({IdParams params}) {
    return courseRepo.getCourseById(params.id);
  }
}
