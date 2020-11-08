import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';
import '../../../../../widgets/error_widget.dart';
import '../../../../../widgets/loading.dart';
import '../../../domain/entity/subject.dart';
import '../../../domain/repositories/subject_repo.dart';
import '../bloc/chapter_bloc.dart';

class ChaptersPage extends StatelessWidget {
  final Subject subject;

  const ChaptersPage({
    Key key,
    @required this.subject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subject.name),
      ),
      body: BlocProvider(
        create: (context) => ChapterBloc(subjectRepo: sl<SubjectRepo>())
          ..add(InitialChapterEvent(subjectId: subject.id)),
        child: BlocBuilder<ChapterBloc, ChapterState>(
          builder: (context, state) {
            if (state is ChaptersRecivedState) {
              return ListView.builder(
                itemCount: state.chapters.length,
                itemBuilder: (context, index) {
                  final chap = state.chapters[index];
                  return ListTile(
                    title: Text(chap.name),
                    onTap: () => print(chap.id),
                  );
                },
              );
            } else if (state is ErrorChaptersState) {
              return ErrorsWidget(
                errors: state.err,
                retryFn: () => context
                    .bloc<ChapterBloc>()
                    .add(InitialChapterEvent(subjectId: subject.id)),
              );
            }
            return Loading();
          },
        ),
      ),
    );
  }
}
