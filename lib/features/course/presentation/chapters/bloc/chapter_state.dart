part of 'chapter_bloc.dart';

abstract class ChapterState extends Equatable {
  const ChapterState();

  @override
  List<Object> get props => [];
}

class ChapterInitial extends ChapterState {}

class ChaptersRecivedState extends ChapterState {
  final List<Chapter> chapters;

  ChaptersRecivedState({
    @required this.chapters,
  });

  @override
  List<Object> get props => [chapters];
}

class LoadingChaptersState extends ChapterState {}

class ErrorChaptersState extends ChapterState {
  final Errors err;

  ErrorChaptersState({
    @required this.err,
  });

  @override
  List<Object> get props => [err];
}
