import 'package:flutter/material.dart';
import 'package:padavukal/core/services/home_page_service.dart';

class HomePage extends StatelessWidget {
  final HomePageService _homePageService = HomePageService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Widget>(
      stream: _homePageService.startListen(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          child: snapshot.data,
        );
      },
    );
  }
}
