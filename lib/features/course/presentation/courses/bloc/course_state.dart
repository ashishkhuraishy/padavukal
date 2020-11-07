part of 'course_bloc.dart';

abstract class CourseState extends Equatable {
  const CourseState();

  @override
  List<Object> get props => [];
}

class CourseInitial extends CourseState {}

class LoadingState extends CourseState {}

class ErrorState extends CourseState {
  final Errors err;

  ErrorState({this.err});
}

class CourseLoaded extends CourseState {
  final List<Course> courses;

  CourseLoaded({
    @required this.courses,
  });
}
