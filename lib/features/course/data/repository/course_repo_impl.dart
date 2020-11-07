import 'package:dartz/dartz.dart';
import 'package:padavukal/core/errors/error.dart';
import 'package:padavukal/features/course/data/data_source/courses_remote.dart';
import 'package:padavukal/features/course/domain/entity/course.dart';
import 'package:padavukal/features/course/domain/entity/sucess_message.dart';
import 'package:padavukal/features/course/domain/repositories/course_repo.dart';

class CourseRepoImpl extends CourseRepo {
  final CoursesRemote coursesRemote;

  CourseRepoImpl({this.coursesRemote});

  @override
  Future<Either<Errors, List<Course>>> getAllCourses() async {
    return await coursesRemote.getAllCourse();
  }

  @override
  Future<Either<Errors, Course>> getCourseById(int id) async {
    return await coursesRemote.getCourseById(id);
  }

  @override
  Future<Either<Errors, SucessMessage>> setAsDefaultCourse(int id) async {
    return await coursesRemote.setAsFDefaultCourse(id);
  }

  @override
  Future<Either<Errors, SucessMessage>> subscribeCourse(int id) async {
    return await coursesRemote.subscribeCourse(id);
  }
}
