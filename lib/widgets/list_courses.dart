import 'package:flutter/material.dart';

import '../features/course/domain/entity/course.dart';

class ListCourses extends StatelessWidget {
  final List<Course> courses;

  const ListCourses({Key key, this.courses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        Course course = courses[index];

        return ListTile(
          title: Text(course.name),
          subtitle: Text(course.isPremium.toString()),
          trailing: CircleAvatar(
            child: Text(
              course.price.toString(),
            ),
          ),
        );
      },
      itemCount: courses.length,
    );
  }
}
