import 'package:flutter/material.dart';
import 'package:padavukal/features/course/presentation/courses/screens/view_all_courses.dart';

class ViewCoursesPage extends StatelessWidget {
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
          Text("You dont have any default courses selected"),
          RaisedButton.icon(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ViewAllCourses()),
            ),
            icon: Icon(Icons.book),
            label: Text("View Courses"),
          ),
        ],
      ),
    );
  }
}
