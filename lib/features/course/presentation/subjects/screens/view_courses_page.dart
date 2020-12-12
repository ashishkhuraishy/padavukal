import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../courses/screens/view_all_courses.dart';
import '../bloc/subject_bloc.dart';

class ViewCoursesPage extends StatelessWidget {
  const ViewCoursesPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("No Courses"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("You dont have any default courses selected"),
          ),
          RaisedButton.icon(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ViewAllCourses(
                  subjectBloc: BlocProvider.of<SubjectBloc>(context),
                ),
              ),
            ),
            icon: Icon(Icons.book),
            label: Text("View Courses"),
          ),
        ],
      ),
    );
  }
}
