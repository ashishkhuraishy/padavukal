part of 'course_bloc.dart';

abstract class CourseState extends Equatable {
  const CourseState();

  @override
  List<Object> get props => [];
}

class CourseInitial extends CourseState {}

class LoadingState extends CourseState {}

class CourseErrorState extends CourseState {
  final Errors err;

  CourseErrorState({@required this.err,});
}

class CourseLoaded extends CourseState {
  final List<Course> courses;

  CourseLoaded({
    @required this.courses,
  });
}

class SucessState extends CourseState {
  final SucessMessage sucessMessage;

  SucessState({
    @required this.sucessMessage,
  });
}
