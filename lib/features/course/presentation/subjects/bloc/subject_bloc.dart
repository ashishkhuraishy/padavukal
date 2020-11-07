import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:padavukal/core/constants/api_contsants.dart';
import 'package:padavukal/core/errors/error.dart';
import 'package:padavukal/features/course/domain/entity/subject.dart';
import 'package:padavukal/features/course/domain/repositories/subject_repo.dart';

part 'subject_event.dart';
part 'subject_state.dart';

class SubjectBloc extends Bloc<SubjectEvent, SubjectState> {
  final SubjectRepo subjectRepo;

  SubjectBloc({
    this.subjectRepo,
  }) : super(SubjectInitial());

  @override
  Stream<SubjectState> mapEventToState(
    SubjectEvent event,
  ) async* {
    if (event is HomePageEvent) {
      yield LoadingState();
      final res = await subjectRepo.getHomePage();

      yield* res.fold(
        (err) async* {
          if (err.statusCode == NO_DEFAULT_COURSE_STATUS_CODE) {
            yield SelectCourseState();
          } else {
            yield ErrorSubjectState(err: err);
          }
        },
        (subjects) async* {
          yield SucessSubjectsState(subjects: subjects);
        },
      );
    }
  }
}
