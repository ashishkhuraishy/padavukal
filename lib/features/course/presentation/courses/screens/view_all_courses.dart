import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:padavukal/features/course/presentation/courses/bloc/course_bloc.dart';
import 'package:padavukal/widgets/error_widget.dart';
import 'package:padavukal/widgets/loading.dart';

import '../../../../../injection_container.dart';

class ViewAllCourses extends StatelessWidget {
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
                    onTap: () => context
                        .bloc<CourseBloc>()
                        .add(SelectCourseEvent(course: course)),
                  );
                },
              );
            } else if (state is CourseErrorState) {
              return ErrorsWidget(
                errors: state.err,
                retryFn: () => context.bloc<CourseBloc>().add(InitialEvent()),
              );
            }
            return Loading();
          },
        ),
      ),
    );
  }
}
