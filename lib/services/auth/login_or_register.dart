import 'package:first_app/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:first_app/pages/login_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //Literaly show login page
  bool showLoginPage = true;

  // toogle between login and register page
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
          onTap: togglePages,
      );
    } else {
      return RegisterPage(
          onTap: togglePages,
      );
    }
  }
}
