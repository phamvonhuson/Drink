import 'package:flutter/material.dart';
import 'package:flutter_project/pages/login_page.dart';
import 'package:flutter_project/pages/signup_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  // Initially, show the login page
  bool showLoginPage = true;

  // Toggle between login and sign up
  void togglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      // Return the LoginPage with an onTap function
      return LoginPage(
        onTap: togglePage, // Call togglePage when the button is pressed
      );
    } else {
      return SignUpPage(onTap: togglePage);
    }
  }
}
