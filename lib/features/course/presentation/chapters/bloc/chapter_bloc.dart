import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:padavukal/core/errors/error.dart';
import 'package:padavukal/features/course/domain/entity/chapter.dart';
import 'package:padavukal/features/course/domain/repositories/subject_repo.dart';

part 'chapter_event.dart';
part 'chapter_state.dart';

class ChapterBloc extends Bloc<ChapterEvent, ChapterState> {
  final SubjectRepo subjectRepo;

  ChapterBloc({
    @required this.subjectRepo,
  }) : super(ChapterInitial());

  @override
  Stream<ChapterState> mapEventToState(
    ChapterEvent event,
  ) async* {
    if (event is InitialChapterEvent) {
      yield LoadingChaptersState();
      final res = await subjectRepo.getChapters(event.subjectId);

      yield res.fold(
        (err) => ErrorChaptersState(err: err),
        (chapters) => ChaptersRecivedState(chapters: chapters),
      );
    }
  }
}
