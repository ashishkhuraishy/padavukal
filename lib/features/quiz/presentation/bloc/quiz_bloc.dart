import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/errors/error.dart';
import '../../../course/domain/entity/chapter.dart';
import '../../../course/domain/entity/subject.dart';
import '../../../course/domain/repositories/subject_repo.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final SubjectRepo subjectRepo;

  QuizBloc({
    @required this.subjectRepo,
  }) : super(QuizInitial());

  @override
  Stream<QuizState> mapEventToState(
    QuizEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is GetChaptersEvent) {
      yield QuizInProgress();
      final res = await subjectRepo.getChapters(event.subject.id);

      yield res.fold(
        (l) => QuizFailure(l),
        (r) => QuizChaptersSuccess(r),
      );
    }
  }
}
