import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:padavukal/features/course/domain/repositories/subject_repo.dart';
import 'package:padavukal/features/course/presentation/subjects/bloc/subject_bloc.dart';
import 'package:padavukal/features/course/presentation/subjects/screens/home/home_tab.dart';
import 'package:padavukal/features/course/presentation/subjects/screens/view_courses_page.dart';
import 'package:padavukal/widgets/error_widget.dart';
import 'package:padavukal/widgets/loading.dart';

import '../../../../../injection_container.dart';

class HomeWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<SubjectBloc>(
        create: (context) =>
            SubjectBloc(subjectRepo: sl())..add(HomePageEvent()),
        child: BlocBuilder<SubjectBloc, SubjectState>(
          builder: (context, state) {
            if (state is SucessSubjectsState) {
              return HomeTab();
            } else if (state is SelectCourseState) {
              return ViewCoursesPage();
            } else if (state is ErrorState) {
              return ErrorsWidget(
                errors: state.err,
              );
            }
            return Loading();
          },
        ),
      ),
    );
  }
}
