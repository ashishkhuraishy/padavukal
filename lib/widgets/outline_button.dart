import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/auth/presentation/bloc/auth_bloc.dart';

class OutLinedButton extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double width;

  OutLinedButton({this.title, this.imageUrl, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      child: OutlineButton(
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0)),
        // padding: EdgeInsets.all(10),
        onPressed: () => BlocProvider.of<AuthBloc>(context).add(LogInEvent()),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Image.asset(
                imageUrl,
                height: 20,
                width: 20,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        borderSide: BorderSide(
          color: Colors.blue,
          style: BorderStyle.solid,
          width: 0.8,
        ),
      ),
    );
  }
}
