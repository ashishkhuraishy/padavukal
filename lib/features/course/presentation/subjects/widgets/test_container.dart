import 'package:flutter/material.dart';

import '../../../../../styles/styles.dart';

class TestContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('Take test now!!!'),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: testGradient,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 3,
              child: Text(
                "Take a Test now",
                textAlign: TextAlign.center,
                style: Theme.of(context).primaryTextTheme.headline5.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Center(
                  child: Image.asset(
                    "assets/images/pana.png",
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
