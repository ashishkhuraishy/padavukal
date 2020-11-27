import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';
import '../../../../../widgets/error_widget.dart';
import '../../../../../widgets/loading.dart';
import '../../subjects/bloc/subject_bloc.dart';
import '../bloc/course_bloc.dart';

class ViewAllCourses extends StatelessWidget {
  final SubjectBloc subjectBloc;

  const ViewAllCourses({
    Key key,
    @required this.subjectBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View All courses'),
      ),
      body: BlocProvider<CourseBloc>(
        create: (context) => CourseBloc(
          // subjectBloc: context.bloc<SubjectBloc>(),
          courseRepo: sl(),
        )..add(InitialEvent()),
        child: BlocListener<CourseBloc, CourseState>(
          listener: (context, state) {
            if (state is SucessState) {
              // Scaffold.of(context).showSnackBar(
              // SnackBar(content: Text("sucess")),
              // );
              subjectBloc.add(HomePageEvent());
              Navigator.pop(context);
              log('Sucess');
            }
          },
          child: BlocBuilder<CourseBloc, CourseState>(
            builder: (context, state) {
              if (state is CourseLoaded) {
                return ListView.builder(
                  itemCount: state.courses.length,
                  itemBuilder: (context, index) {
                    var course = state.courses[index];
                    return ListTile(
                      title: Text(course.name),
                      trailing: Text(course.price.toString()),
                      onTap: () => context.bloc<CourseBloc>().add(
                            SelectCourseEvent(course: course),
                          ),
                    );
                  },
                );
              } else if (state is CourseErrorState) {
                return ErrorsWidget(
                  errors: state.err,
                  retryFn: () => context.bloc<CourseBloc>().add(InitialEvent()),
                );
              } else if (state is SucessState) {
                return Container();
              }
              return Loading();
            },
          ),
        ),
      ),
    );
  }
}
