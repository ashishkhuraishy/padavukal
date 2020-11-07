import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';
import '../../../../../widgets/error_widget.dart';
import '../../../../../widgets/loading.dart';
import '../../../domain/repositories/subject_repo.dart';
import '../bloc/subject_bloc.dart';
import 'home/home_tab.dart';
import 'view_courses_page.dart';

class HomeWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<SubjectBloc>(
        create: (context) =>
            SubjectBloc(subjectRepo: sl<SubjectRepo>())..add(HomePageEvent()),
        child: BlocBuilder<SubjectBloc, SubjectState>(
          builder: (context, state) {
            if (state is SucessSubjectsState) {
              return HomeTab(
                subjects: state.subjects,
              );
            } else if (state is SelectCourseState) {
              return ViewCoursesPage();
            } else if (state is ErrorState) {
              return ErrorsWidget(
                errors: state.err,
                retryFn: () =>
                    BlocProvider.of<SubjectBloc>(context).add(HomePageEvent()),
              );
            }
            return Loading();
          },
        ),
      ),
    );
  }
}
