part of 'subject_bloc.dart';

abstract class SubjectState extends Equatable {
  const SubjectState();

  @override
  List<Object> get props => [];
}

class SubjectInitial extends SubjectState {}

class LoadingState extends SubjectState {}

class SucessSubjectsState extends SubjectState {
  final List<Subject> subjects;

  SucessSubjectsState({this.subjects});

  @override
  List<Object> get props => [subjects];
}

class SelectCourseState extends SubjectState {}

class ErrorSubjectState extends SubjectState {
  final Errors err;

  ErrorSubjectState({this.err});
}
