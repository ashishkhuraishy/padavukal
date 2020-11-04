import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:padavukal/core/services/home_page_service.dart';

class SubjectsPage extends StatelessWidget {
  final HomePageService _homePageService = HomePageService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
        centerTitle: true,
      ),
      body: StreamBuilder<Widget>(
        stream: _homePageService.startListen(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          log(snapshot.connectionState.toString());
          return Container(
            child: snapshot.data,
          );
        },
      ),
    );
  }
}
