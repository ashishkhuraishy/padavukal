import 'package:flutter/material.dart';
import 'package:padavukal/features/course/domain/entity/subject.dart';
import 'package:padavukal/features/course/presentation/subjects/screens/home/home_page.dart';
import 'package:padavukal/features/course/presentation/subjects/screens/view_courses_page.dart';

class HomeTab extends StatefulWidget {
  final List<Subject> subjects;

  const HomeTab({
    Key key,
    @required this.subjects,
  }) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Padavukal'),
      ),
      body: PageView(
        children: [
          HomePage(subjects: null),
          ViewCoursesPage(),
          ViewCoursesPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
          ),
        ],
        backgroundColor: Colors.blue[700],
      ),
    );
  }
}
