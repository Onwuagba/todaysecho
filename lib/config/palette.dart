import 'package:flutter/material.dart';

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

ButtonStyle verificationButton(BuildContext context) {
  return TextButton.styleFrom(
    fixedSize: Size(screenWidth(context) - 40, 55),
    backgroundColor: Colors.black,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topLeft: Radius.circular(15),
      bottomLeft: Radius.circular(15),
      bottomRight: Radius.circular(15),
    )),
  );
}

TextTheme textTheme = TextTheme(
  headline1: TextStyle(color: Colors.black),
  headline2: TextStyle(color: Colors.black),
  headline3: TextStyle(color: Colors.black),
  headline4: TextStyle(color: Colors.black),
  headline5: TextStyle(color: Colors.black),
  headline6: TextStyle(color: Colors.black),
  caption: TextStyle(color: Colors.black),
);

final headerStyle = TextStyle(fontSize: 15, fontWeight: FontWeight.w700);
final hightlightFont = TextStyle(color: Colors.white, fontSize: 18);
