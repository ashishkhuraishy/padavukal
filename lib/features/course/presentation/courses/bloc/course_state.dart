part of 'course_bloc.dart';

abstract class CourseState extends Equatable {
  const CourseState();
  
  @override
  List<Object> get props => [];
}

class CourseInitial extends CourseState {}
