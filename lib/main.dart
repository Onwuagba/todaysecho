import 'package:flutter/material.dart';
import 'package:todaysecho/config/palette.dart';
import 'package:todaysecho/screens/home_screen.dart';
import 'package:todaysecho/screens/login_screen.dart';
import 'package:todaysecho/screens/main_screens.dart';
import 'package:todaysecho/screens/signup_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todays Echo',
      theme: ThemeData(
        textTheme: textTheme,
        primarySwatch: Colors.blue,
      ),
      home: MainScreens(),
    );
  }
}
