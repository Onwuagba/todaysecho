import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todaysecho/config/palette.dart';
import 'package:todaysecho/screens/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Set the protrait of the screen to be default down or up
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 20),
                signUpTextField(
                    controller: _usernameController, title: "username"),
                SizedBox(height: 20),
                signUpTextField(controller: _emailController, title: "email"),
                SizedBox(height: 20),
                signUpTextField(
                    controller: _passwordController, title: "password"),
                SizedBox(height: 20),
                signUpTextField(
                    controller: _confirmpasswordController,
                    title: "confirm password"),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Register",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: verificationButton(context),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LogInScreen()));
                          },
                          child: Text("Sign In"))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextField signUpTextField(
      {TextEditingController? controller, String? title}) {
    return TextField(
      controller: controller,
      autocorrect: false,
      decoration:
          InputDecoration(labelText: title, border: OutlineInputBorder()),
    );
  }
}
