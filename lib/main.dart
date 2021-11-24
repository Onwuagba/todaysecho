import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:todaysecho/config/palette.dart';
import 'package:todaysecho/config/state_management.dart';
import 'package:todaysecho/screens/home_screen.dart';
import 'package:todaysecho/screens/login_screen.dart';
import 'package:todaysecho/screens/main_screens.dart';
import 'package:todaysecho/screens/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppProvider>(
      create: (context) => AppProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todays Echo',
        theme: ThemeData(
          canvasColor: Colors.white,
          backgroundColor: Colors.white,
          textTheme: textTheme,
          primarySwatch: Colors.blue,
        ),
        home: MainScreens(),
      ),
    );
  }
}
