import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../widgets/error_widget.dart';
import '../../../../../widgets/loading.dart';
import '../bloc/subject_bloc.dart';
import 'home/home_tab.dart';
import 'view_courses_page.dart';

class HomeWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.bloc<SubjectBloc>().add(HomePageEvent());
    return Scaffold(
      body: BlocBuilder<SubjectBloc, SubjectState>(
        builder: (context, state) {
          if (state is SucessSubjectsState) {
            return HomeTab(
              subjects: state.subjects,
            );
          } else if (state is SelectCourseState) {
            return ViewCoursesPage();
          } else if (state is ErrorSubjectState) {
            return ErrorsWidget(
              errors: state.err,
              retryFn: () =>
                  BlocProvider.of<SubjectBloc>(context).add(HomePageEvent()),
            );
          }
          return Loading();
        },
      ),
    );
  }
}
