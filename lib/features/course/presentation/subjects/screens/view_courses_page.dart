import 'package:flutter/material.dart';

class ViewCoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("No Courses"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("You dont have any default courses selected"),
          RaisedButton.icon(
            onPressed: () => print("View Courses Clicked"),
            icon: Icon(Icons.book),
            label: Text("View Courses"),
          ),
        ],
      ),
    );
  }
}
