
import 'package:flutter/material.dart';
import 'package:wechat/authentication/authentication.dart';
import 'package:wechat/home.dart';
import 'package:wechat/widges/button.dart';
import 'package:wechat/widges/text_field.dart';
import 'login.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool isLoading = false;
  void despose(){
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }
  void signUpUser() async {
    setState(() {
      isLoading = true;
    });
    String result = await Authentication().signUpUser(
      name: nameController.text,
      password: passwordController.text,
      email: emailController.text,
    );

    if (result == "Success") {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => homeScreen(),
        ),
      );
    } else {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                child: Image.asset("image/signup.jpeg"),
              ),
              TextFieldinput(
                textEditingController: nameController,
                hintText: "Enter Your Name",
                icon: Icons.person,
              ),
              TextFieldinput(
                textEditingController: emailController,
                hintText: "Enter Your Email",
                icon: Icons.email,
              ),
              TextFieldinput(
                textEditingController: passwordController,
                hintText: "Enter Your Password",
                icon: Icons.lock,
              ),
              isLoading
                  ? CircularProgressIndicator()
                  : button(onTab: signUpUser, text: "Signup"),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Loginscreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
