part of 'quiz_bloc.dart';

abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

class QuizInitial extends QuizState {}

class QuizInProgress extends QuizState {}

class QuizChaptersSuccess extends QuizState {
  const QuizChaptersSuccess(this.chapters);

  final List<Chapter> chapters;

  @override
  List<Object> get props => [chapters];
}

class QuizesSuccess extends QuizState {
  // TODO: change to quiz entity
  const QuizesSuccess(this.chapters);

  final List<Chapter> chapters;

  @override
  List<Object> get props => [chapters];
}

class QuizFailure extends QuizState {
  const QuizFailure(this.error);

  final Errors error;

  @override
  List<Object> get props => [error];
}
