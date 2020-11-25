import 'package:dartz/dartz.dart';

import '../../../../core/errors/error.dart';
import '../../domain/entity/course.dart';
import '../../domain/entity/sucess_message.dart';
import '../../domain/repositories/course_repo.dart';
import '../data_source/courses_remote.dart';

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
