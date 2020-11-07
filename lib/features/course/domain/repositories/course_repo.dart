import 'package:dartz/dartz.dart';
import 'package:padavukal/core/errors/error.dart';
import 'package:padavukal/features/course/domain/entity/course.dart';
import 'package:padavukal/features/course/domain/entity/sucess_message.dart';

abstract class CourseRepo {
  Future<Either<Errors, List<Course>>> getAllCourses();
  Future<Either<Errors, Course>> getCourseById(int id);

  Future<Either<Errors, SucessMessage>> subscribeCourse(int id);
  Future<Either<Errors, SucessMessage>> setAsDefaultCourse(int id);
}
