import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todaysecho/config/palette.dart';
import 'package:todaysecho/config/state_management.dart';
import 'package:todaysecho/screens/bookmark_screen.dart';
import 'package:todaysecho/screens/home_screen.dart';
import 'package:todaysecho/screens/profile_screen.dart';

class MainScreens extends StatefulWidget {
  MainScreensState createState() => MainScreensState();
}

class MainScreensState extends State<MainScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AppProvider>(builder: (context, app, snapshot) {
        return Column(
          children: [app.screen, _navigationBar(context)],
        );
      }),
    );
  }

  Container _navigationBar(BuildContext context) {
    AppProvider _appProvider = Provider.of<AppProvider>(context, listen: false);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 50,
      width: screenSizeWidth(context),
      decoration: BoxDecoration(
        color: Color(0xe3ffffff),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(_appProvider.screen.toString() == "HomeScreen"
                ? Icons.home
                : Icons.home_outlined),
            onPressed: () {
              _appProvider.changeScreen(HomeScreen());
            },
          ),
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(
            icon: Icon(_appProvider.screen.toString() == "BookMarkScreen"
                ? Icons.bookmark
                : Icons.bookmark_outline),
            onPressed: () {
              _appProvider.changeScreen(BookMarkScreen());
            },
          ),
          IconButton(
            icon: Icon(_appProvider.screen.toString() == "ProfileScreen"
                ? Icons.person
                : Icons.person_outline),
            onPressed: () {
              _appProvider.changeScreen(ProfileScreen());
            },
          ),
        ],
      ),
    );
  }
}
