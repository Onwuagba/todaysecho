import 'package:flutter/material.dart';
import 'package:todaysecho/config/palette.dart';
import 'package:todaysecho/screens/home_screen.dart';

class MainScreens extends StatefulWidget {
  MainScreensState createState() => MainScreensState();
}

class MainScreensState extends State<MainScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          HomeScreen(),
          Container(
            margin: EdgeInsets.only(bottom: 15),
            padding: EdgeInsets.symmetric(horizontal: 25),
            height: 50,
            width: screenSizeWidth(context) - 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(25)),
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.home_outlined),
                Icon(Icons.bookmark_outline),
                Icon(Icons.person_outline)
              ],
            ),
          )
        ],
      ),
    );
  }
}
