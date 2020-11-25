import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';
import '../../../../../styles/styles.dart';
import '../../../../../widgets/error_widget.dart';
import '../../../../../widgets/loading.dart';
import '../../../domain/entity/subject.dart';
import '../../../domain/repositories/subject_repo.dart';
import '../bloc/chapter_bloc.dart';
import '../widgets/chapter_list.dart';

class ChaptersPage extends StatelessWidget {
  final Subject subject;
  final Color bgColor;
  final String iconImage;

  const ChaptersPage({
    Key key,
    @required this.subject,
    @required this.bgColor,
    @required this.iconImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              color: bgColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 4,
                    child: Center(
                      child: Text(
                        subject.name,
                        style: whiteheading,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(child: Image.asset(iconImage)),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                'Chapters',
                style: chapheading,
              ),
            ),
            BlocProvider(
              create: (context) => ChapterBloc(subjectRepo: sl<SubjectRepo>())
                ..add(InitialChapterEvent(subjectId: subject.id)),
              child: BlocBuilder<ChapterBloc, ChapterState>(
                builder: (context, state) {
                  if (state is ChaptersRecivedState) {
                    return ChapterList(
                      chapters: state.chapters,
                    );
                  } else if (state is ErrorChaptersState) {
                    return ErrorsWidget(
                      errors: state.err,
                      retryFn: () => context.bloc<ChapterBloc>().add(
                            InitialChapterEvent(subjectId: subject.id),
                          ),
                    );
                  }
                  return Loading();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
