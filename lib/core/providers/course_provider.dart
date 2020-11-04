import 'package:flutter/cupertino.dart';
import 'package:padavukal/features/course/domain/use_case/get_all_courses.dart';
import 'package:padavukal/features/course/domain/use_case/get_course_id.dart';

import '../../injection_container.dart';

class CourseProvider extends ChangeNotifier {
  GetAllCourses _getAllCourses = GetAllCourses(courseRepo: sl());
  GetCourseById _getCourseById = GetCourseById(courseRepo: sl());
}
