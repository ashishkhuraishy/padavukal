import 'package:dartz/dartz.dart';

import '../../../../core/config/use_case_config.dart';
import '../../../../core/errors/error.dart';
import '../entity/course.dart';
import '../repositories/course_repo.dart';

class GetAllCourses extends UseCase<List<Course>, NoParams> {
  final CourseRepo courseRepo;

  GetAllCourses({this.courseRepo});

  @override
  Future<Either<Errors, List<Course>>> call({NoParams params}) {
    return courseRepo.getAllCourses();
  }
}
