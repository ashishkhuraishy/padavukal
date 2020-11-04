import 'package:flutter/cupertino.dart';
import 'package:padavukal/features/course/domain/use_case/get_all_courses.dart';
import 'package:padavukal/widgets/error_widget.dart';
import 'package:padavukal/widgets/list_courses.dart';
import 'package:padavukal/widgets/loading.dart';

import '../../injection_container.dart';

class GetAllCourseService {
  GetAllCourses _getAllCourses = GetAllCourses(courseRepo: sl());

  Stream<Widget> startListen() async* {
    yield Loading();

    final res = await _getAllCourses.call();
    yield* res.fold(
      (error) async* {
        yield ErrorsWidget(
          errors: error,
        );
      },
      (courses) async* {
        yield ListCourses(
          courses: courses,
        );
      },
    );
  }
}
