import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/errors/error.dart';
import '../../../domain/entity/course.dart';
import '../../../domain/repositories/course_repo.dart';
import '../../subjects/bloc/subject_bloc.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseRepo courseRepo;
  final SubjectBloc subjectBloc;

  CourseBloc({
    @required this.subjectBloc,
    @required this.courseRepo,
  }) : super(CourseInitial());

  @override
  Stream<CourseState> mapEventToState(
    CourseEvent event,
  ) async* {
    if (event is CourseInitial) {
      yield LoadingState();

      final res = await courseRepo.getAllCourses();

      yield* res.fold(
        (err) async* {
          yield ErrorState(err: err);
        },
        (courses) async* {
          yield CourseLoaded(courses: courses);
        },
      );
    } else if (event is SelectCourseEvent) {
      if (event.course.isSubscribed) {
        // TODO : implement course subscribe logic

      } else {
        // TODO: implement course renew logic
      }
    }
  }
}
