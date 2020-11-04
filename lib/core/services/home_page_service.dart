import 'package:flutter/material.dart';
import 'package:padavukal/features/course/domain/use_case/home_page.dart';
import 'package:padavukal/screens/course_list.dart';
import 'package:padavukal/widgets/error_widget.dart';
import 'package:padavukal/widgets/loading.dart';
import 'package:padavukal/widgets/subject_list_widget.dart';

import '../../injection_container.dart';

class HomePageService {
  GetHomePage _getHomePage = GetHomePage(subjectRepo: sl());

  Stream<Widget> startListen() async* {
    yield Loading();

    final res = await _getHomePage.call();
    yield* res.fold(
      (error) async* {
        if (error.statusCode == "426") {
          yield CoursesListPage();
        } else {
          yield ErrorsWidget(
            errors: error,
          );
        }
      },
      (subjects) async* {
        yield SubjectListWidg(
          subjects: subjects,
        );
      },
    );
  }
}
