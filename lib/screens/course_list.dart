import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:padavukal/core/services/get_all_course_service.dart';

class CoursesListPage extends StatelessWidget {
  final GetAllCourseService _getAllCourseService = GetAllCourseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Courses"),
        centerTitle: true,
      ),
      body: StreamBuilder<Widget>(
        stream: _getAllCourseService.startListen(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          log(snapshot.connectionState.toString());
          return Container(
            child: snapshot.data,
          );
        },
      ),
    );
  }
}
