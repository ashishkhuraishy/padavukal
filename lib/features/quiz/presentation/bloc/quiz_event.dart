part of 'quiz_bloc.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object> get props => [];
}

class GetChaptersEvent extends QuizEvent {
  final Subject subject;

  GetChaptersEvent(this.subject);

  @override
  List<Object> get props => [subject];
}

class GetQuizInfo extends QuizEvent {
  final Chapter chapter;

  GetQuizInfo(this.chapter);

  @override
  List<Object> get props => [chapter];
}
