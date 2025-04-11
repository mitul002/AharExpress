import 'package:first_app/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // register method
  void register() async {
    // get auth service
    final authService = AuthService();

    // check if passwords match -> create user
    if (passwordController.text == confirmPasswordController.text) {
      // try creating user
      try {
        await authService.signUpWithEmailPassword(
          emailController.text,
          passwordController.text,
        );
      }

      //display any errors
      catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Box Faka Kisu lekhen"),
          ),
        );
      }
    }

    // if passwords dont match -> show error
    else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Dui Password Ek hoy nai"),
        ),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              SizedBox(
                width: 250,
                height: 250,
                child: Image.asset("lib/images/logo/Screenshot 2025-03-27 131620.png"),
              ),
          
              const SizedBox(height: 15),
          
              Text(
                "let's create an account for you",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 16,
                ),
              ),
          
              const SizedBox(height: 25),
          
              //email er jayga
              MyTextField(
                  controller: emailController,
                  hinText: "Email",
                  obscureText: false),
          
              const SizedBox(height: 10),
          
              //password er jayga
              MyTextField(
                  controller: passwordController,
                  hinText: "Password",
                  obscureText: true),
          
              const SizedBox(height: 10),
          
              //confirm password jayga
              MyTextField(
                  controller: confirmPasswordController,
                  hinText: "Confirm Password",
                  obscureText: true),
          
              const SizedBox(height: 10),
          
              //sign in  er button
              MyButton(
                text: "Sign Up",
                onTap: register,
              ),
          
              const SizedBox(height: 25),
          
              //Already have an account? Login here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Login Now",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
