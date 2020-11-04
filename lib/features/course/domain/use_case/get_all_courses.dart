import 'package:dartz/dartz.dart';
import 'package:padavukal/core/config/use_case_config.dart';
import 'package:padavukal/core/errors/error.dart';
import 'package:padavukal/features/course/domain/entity/course.dart';
import 'package:padavukal/features/course/domain/repositories/course_repo.dart';

class GetAllCourses extends UseCase<List<Course>, NoParams> {
  final CourseRepo courseRepo;

  GetAllCourses({this.courseRepo});

  @override
  Future<Either<Errors, List<Course>>> call({NoParams params}) {
    return courseRepo.getAllCourses();
  }
}
