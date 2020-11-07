part of 'course_bloc.dart';

abstract class CourseEvent extends Equatable {
  const CourseEvent();

  @override
  List<Object> get props => [];
}

class InitialEvent extends CourseEvent {}

class SelectCourseEvent extends CourseEvent {
  final Course course;

  SelectCourseEvent({
    @required this.course,
  });

  @override
  List<Object> get props => [course];
}
