import 'package:dartz/dartz.dart';
import 'package:padavukal/core/config/api_config.dart';
import 'package:padavukal/core/constants/api_contsants.dart';
import 'package:padavukal/core/errors/error.dart';
import 'package:padavukal/features/course/data/models/course_model.dart';
import 'package:padavukal/features/course/domain/entity/course.dart';

abstract class CoursesRemote {
  Future<Either<Errors, List<Course>>> getAllCourse();
  Future<Either<Errors, Course>> getCourseById(int id);
}

class CourseRemoteImpl extends CoursesRemote {
  final ApiConfig config;

  CourseRemoteImpl({this.config});

  @override
  Future<Either<Errors, List<Course>>> getAllCourse() async {
    return await config.getList<CourseModel>(
      endpoint: ApiEndpoints.courses,
      instance: CourseModel(),
    );
  }

  @override
  Future<Either<Errors, Course>> getCourseById(int id) async {
    return await config.get<CourseModel>(
      endpoint: ApiEndpoints.courses + '$id',
      instance: CourseModel(),
    );
  }
}
