import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:padavukal/features/auth/bloc/auth_bloc.dart';
import 'package:padavukal/features/course/domain/use_case/get_all_courses.dart';
import 'package:padavukal/features/course/domain/use_case/get_course_id.dart';
import 'package:padavukal/features/course/domain/use_case/set_as_default.dart';
import 'package:padavukal/features/course/domain/use_case/subscribe_course.dart';
import 'package:padavukal/features/course/presentation/subjects/bloc/subject_bloc.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final GetAllCourses getAllCourses;
  final GetCourseById getCourseById;
  final SetAsDefault setAsDefaultCourse;
  final SubscribeCourse subscribeCourse;

  final SubjectBloc subjectBloc;

  CourseBloc({
    this.subjectBloc,
    this.getAllCourses,
    this.getCourseById,
    this.setAsDefaultCourse,
    this.subscribeCourse,
  }) : super(CourseInitial());

  @override
  Stream<CourseState> mapEventToState(
    CourseEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
