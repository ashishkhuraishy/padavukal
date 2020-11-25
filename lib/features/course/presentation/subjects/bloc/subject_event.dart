part of 'subject_bloc.dart';

abstract class SubjectEvent extends Equatable {
  const SubjectEvent();

  @override
  List<Object> get props => [];
}

class HomePageEvent extends SubjectEvent {}

class SucessSubjectsEvent extends SubjectEvent {
  final List<Subject> subjects;

  SucessSubjectsEvent({
    this.subjects,
  });

  @override
  List<Object> get props => [subjects];
}

class ErrorSubjectsEvent extends SubjectEvent {}

class NotFoundSubjectsEvent extends SubjectEvent {}

class GetChaptersEvent extends SubjectEvent {
  final int id;

  GetChaptersEvent({this.id});
}
