import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// final blacktext = TextStyle(
//     color: Colors.black,
//     fontSize: 20,
//     fontWeight: FontWeight.bold,
//     letterSpacing: 1.2);

// final blueheading = TextStyle(
//     fontSize: 25,
//     fontWeight: FontWeight.bold,
//     color: Color.fromRGBO(87, 113, 251, 1));

// final blueheading2 =
//     TextStyle(fontSize: 16, color: Color.fromRGBO(87, 113, 251, 1));

final whiteheading = TextStyle(fontSize: 30, color: Colors.white);

final whiteheading2 = TextStyle(fontSize: 15, color: Colors.white);

final onboardTitleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

final onboardSubitleStyle =
    TextStyle(fontSize: 12, fontWeight: FontWeight.w600);

final chapheading = (TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
final chapsubheading = (TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
));

final testGradient = LinearGradient(
  colors: [
    Color.fromRGBO(44, 107, 203, 44),
    Color.fromRGBO(44, 107, 203, 100),
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

final testdesc = TextStyle(color: Colors.white, fontSize: 16);
final testdesc2 = TextStyle(color: Colors.white, fontSize: 14);

final blackappbartext = TextStyle(
  color: Colors.black,
  fontSize: 16,
);

ThemeData themes() {
  return ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: Color.fromRGBO(87, 113, 251, 1),
    textTheme: ThemeData.light().textTheme.copyWith(
        headline4: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(87, 113, 251, 1)),
        headline5: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
    /////////
    primaryTextTheme: TextTheme(
        headline5: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        headline6: TextStyle(
          color: Color.fromRGBO(87, 113, 251, 1),
          fontWeight: FontWeight.bold,
        )),
  );
}
