part of 'chapter_bloc.dart';

abstract class ChapterEvent extends Equatable {
  const ChapterEvent();

  @override
  List<Object> get props => [];
}

class InitialChapterEvent extends ChapterEvent {
  final int subjectId;

  InitialChapterEvent({
    @required this.subjectId,
  });

  @override
  List<Object> get props => [subjectId];
}

class LoadingChapterEvent extends ChapterEvent {}

class ErrorChapterEvent extends ChapterEvent {}
