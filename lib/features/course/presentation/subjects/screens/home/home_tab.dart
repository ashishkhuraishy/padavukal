import 'package:flutter/material.dart';

import '../../../../../quiz/presentation/screens/quiz_page.dart';
import '../../../../domain/entity/subject.dart';
import 'accounts_page.dart';
import 'home_page.dart';

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
  int indx = 0;
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: indx,
      keepPage: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) => setState(() => indx = value),
        children: [
          HomePage(subjects: widget.subjects),
          QuizPage(subjects: widget.subjects),
          AccountPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          _pageController.animateToPage(
            value,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
          );
          setState(() => indx = value);
        },
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        currentIndex: indx,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Test',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        backgroundColor: Colors.blue[700],
      ),
    );
  }
}
