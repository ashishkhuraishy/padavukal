import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/errors/error.dart';
import '../../../domain/entity/course.dart';
import '../../../domain/entity/sucess_message.dart';
import '../../../domain/repositories/course_repo.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseRepo courseRepo;
  // final SubjectBloc subjectBloc;

  CourseBloc({
    // @required this.subjectBloc,
    @required this.courseRepo,
  }) : super(CourseInitial());

  @override
  Stream<CourseState> mapEventToState(
    CourseEvent event,
  ) async* {
    if (event is InitialEvent) {
      yield LoadingState();

      final res = await courseRepo.getAllCourses();

      yield res.fold(
        (err) => CourseErrorState(err: err),
        (courses) => CourseLoaded(courses: courses),
      );
    } else if (event is SelectCourseEvent) {
      yield LoadingState();
      if (event.course.isSubscribed) {
        final res = await courseRepo.setAsDefaultCourse(event.course.id);
        yield res.fold(
          (err) => CourseErrorState(err: err),
          (sucess) => SucessState(sucessMessage: sucess),
        );
        //TODO: check for premium

      } else {
        final res = await courseRepo.subscribeCourse(event.course.id);
        yield res.fold(
          (err) => CourseErrorState(err: err),
          (sucess) => SucessState(sucessMessage: sucess),
        );
      }
    }
  }
}
