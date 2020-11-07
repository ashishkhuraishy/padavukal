import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:padavukal/features/auth/bloc/auth_bloc.dart';
import 'package:padavukal/screens/course_list.dart';
import 'package:padavukal/screens/subjects_page.dart';

class Home extends StatelessWidget {
  final User user;

  const Home({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Welcome ${user.displayName}")),
          SizedBox(
            height: 25,
          ),
          RaisedButton.icon(
            onPressed: () async {
              String token = await user.getIdToken();
              log(token);
            },
            icon: Icon(Icons.security_outlined),
            label: Text("Get Token"),
          ),
          RaisedButton.icon(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CoursesListPage(),
                ),
              );
            },
            icon: Icon(Icons.navigate_next),
            label: Text("Get all courses"),
          ),
          RaisedButton.icon(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SubjectsPage(),
                ),
              );
            },
            icon: Icon(Icons.navigate_next),
            label: Text("Get all Subjects"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<AuthBloc>(context).add(LogOutEvent());
        },
        child: Icon(Icons.logout),
      ),
    );
  }
}
