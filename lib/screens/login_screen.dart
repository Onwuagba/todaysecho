import 'package:flutter/material.dart';
import 'package:todaysecho/config/palette.dart';

class LogInScreen extends StatefulWidget {
  @override
  LogInScreenState createState() => LogInScreenState();
}

class LogInScreenState extends State<LogInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var textButtonStyle = TextButton.styleFrom(
      fixedSize: Size(screenSizeWidth(context) - 80, 50),
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      )),
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              // height: screenSizeHeight(context),
              margin: EdgeInsets.only(bottom: 30),
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 40),
                  ),
                  SizedBox(height: 50),
                  TextField(
                    controller: emailController,
                    autocorrect: false,
                    decoration: InputDecoration(
                        labelText: "Email", border: OutlineInputBorder()),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    autocorrect: false,
                    decoration: InputDecoration(
                        labelText: "Password", border: OutlineInputBorder()),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: textButtonStyle),
                  // Spacer(flex: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have any account?"),
                      TextButton(onPressed: null, child: Text("Sign Up"))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
