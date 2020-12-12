import 'package:dartz/dartz.dart';

import '../../../../core/config/api_config.dart';
import '../../../../core/constants/api_contsants.dart';
import '../../../../core/errors/error.dart';
import '../../domain/entity/course.dart';
import '../../domain/entity/sucess_message.dart';
import '../models/course_model.dart';
import '../models/sucess_message_model.dart';

abstract class CoursesRemote {
  Future<Either<Errors, List<Course>>> getAllCourse();
  Future<Either<Errors, Course>> getCourseById(int id);
  Future<Either<Errors, SucessMessage>> subscribeCourse(int id);
  Future<Either<Errors, SucessMessage>> setAsFDefaultCourse(int id);
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

  @override
  Future<Either<Errors, SucessMessage>> setAsFDefaultCourse(int id) async {
    Map<String, dynamic> data = {"course": id};

    return await config.post<SucessMessageModel>(
      endpoint: ApiEndpoints.updateDefaultCourse,
      instance: SucessMessageModel(),
      data: data,
    );
  }

  @override
  Future<Either<Errors, SucessMessage>> subscribeCourse(int id) async {
    Map<String, dynamic> data = {"course": id};

    return await config.post<SucessMessageModel>(
      endpoint: ApiEndpoints.subscribe,
      instance: SucessMessageModel(),
      data: data,
    );
  }
}
