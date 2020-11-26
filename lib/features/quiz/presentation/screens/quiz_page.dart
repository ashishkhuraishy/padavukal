import 'package:flutter/material.dart';
import 'package:padavukal/features/course/domain/entity/subject.dart';

class QuizPage extends StatefulWidget {
  final List<Subject> subjects;

  const QuizPage({
    Key key,
    @required this.subjects,
  }) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Subject _subject;

  @override
  void initState() {
    _subject = widget.subjects[0] ??
        Subject(
          id: 0,
          courseId: 0,
          name: '',
        );
    super.initState();
  }

  DropdownMenuItem<Subject> _buildMenuItems(Subject subject) {
    return DropdownMenuItem<Subject>(
      child: Text(subject.name),
      value: subject,
      onTap: () => print(this.toString()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              DropdownButton<Subject>(
                items: widget.subjects.map((e) => _buildMenuItems(e)).toList(),
                onChanged: (value) => setState(() => _subject = value),
                value: _subject,
              ),
            ],
          )
        ],
      ),
    );
  }
}
