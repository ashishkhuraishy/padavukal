import 'package:flutter/material.dart';
import 'package:padavukal/features/course/presentation/subjects/screens/view_courses_page.dart';

class HomeTab extends StatefulWidget {
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
          ViewCoursesPage(),
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
