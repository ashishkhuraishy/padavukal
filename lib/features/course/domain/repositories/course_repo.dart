import 'package:dartz/dartz.dart';

import '../../../../core/errors/error.dart';
import '../entity/course.dart';
import '../entity/sucess_message.dart';

abstract class CourseRepo {
  Future<Either<Errors, List<Course>>> getAllCourses();
  Future<Either<Errors, Course>> getCourseById(int id);

  Future<Either<Errors, SucessMessage>> subscribeCourse(int id);
  Future<Either<Errors, SucessMessage>> setAsDefaultCourse(int id);
}
