import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todaysecho/config/palette.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
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
      body: SingleChildScrollView(
        child: Container(
          height: screenSizeHeight(context),
          padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(flex: 2),
              Text(
                "Sign Up",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 50),
              signUpTextField(
                  controller: _firstnameController, title: "firstname"),
              SizedBox(height: 20),
              signUpTextField(
                  controller: _lastnameController, title: "lastname"),
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
              Spacer(flex: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  TextButton(onPressed: () {}, child: Text("Sign In"))
                ],
              )
            ],
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
