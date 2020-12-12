import 'package:flutter/material.dart';
import '../features/course/domain/entity/subject.dart';

class SubjectListWidg extends StatelessWidget {
  final List<Subject> subjects;

  const SubjectListWidg({Key key, this.subjects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        var _subject = subjects[index];
        return ListTile(
          title: Text(_subject.name),
        );
      },
    );
  }
}
