import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todaysecho/config/palette.dart';
import 'package:todaysecho/screens/signup_screen.dart';

class LogInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: screenHeight(context),
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(flex: 2),
                Text(
                  "Login",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
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
                    style: verificationButton(context)),
                Spacer(flex: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have any account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()));
                        },
                        child: Text("Sign Up"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
