// import 'package:flutter/material.dart';
// import 'package:wechat/chat/chat.dart';
// import 'package:wechat/signup.dart';
// import 'package:wechat/widges/button.dart';
// import 'package:wechat/widges/text_field.dart';
//
// import 'authentication/authentication.dart';
// import 'home.dart';
// class Loginscreen extends StatefulWidget {
//   final String? name;
//   const Loginscreen ({super.key, this.name});
//
//   @override
//   State<Loginscreen> createState() => _State();
// }
//
// class _State extends State<Loginscreen> {
//   final TextEditingController nameController=TextEditingController();
//
//   final TextEditingController emailController=TextEditingController();
//   final TextEditingController passwordController=TextEditingController();
//   bool isLoading=false;
//   void loginUser() async {
//     setState(() {
//       isLoading = true;
//     });
//     String result = await Authentication().loginUser(
//       name: nameController.text,
//       password: passwordController.text,
//       email: emailController.text,
//     );
//
//     if (result == "Success") {
//       //navigate to chat screen
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(
//           builder: (context) => chatScreen(name: nameController.text),
//         ),
//       );
//     } else {
//       setState(() {
//        // isLoading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(result),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SizedBox(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 300,
//                 child: Image.asset("image/login.jpg"),
//               ),
//               TextFieldinput(  textEditingController: nameController,
//                   hintText: "Enter Your name",
//                   icon: Icons.person),
//           TextFieldinput(  textEditingController: emailController,
//           hintText: "Enter Your Email",
//           icon: Icons.email),
//               TextFieldinput(  textEditingController: passwordController,
//                   hintText: "Enter Your Password",
//                   icon: Icons.lock,
//               ),
//
//               Align(
//                   alignment: Alignment.center,
//                   child:Text("Forget password?",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20,color: Colors.purple),)),
//                button(onTab: loginUser, text: "Login"),
//
//             Row(
//                 mainAxisAlignment:MainAxisAlignment.center,
//               children: [
//                 const Text("Don't have account?",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
//                // It's often used to capture various types of user interactions such as taps, swipes, and drags
//                 GestureDetector(
//                   onTap: (){
//                     Navigator.push(context, MaterialPageRoute(
//                       builder: (context)=>const SignupScreen(),
//                     ));
//                   },
//                   child: Text("SIGNUP",
//                   style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20)
//                   ),
//                 )
//               ],
//             )
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:wechat/chat/chat.dart';
import 'package:wechat/signup.dart';
import 'package:wechat/widges/button.dart';
import 'package:wechat/widges/text_field.dart';

import 'authentication/authentication.dart';
import 'home.dart';

class Loginscreen extends StatefulWidget {
  final String? name;
  const Loginscreen({super.key, this.name});

  @override
  State<Loginscreen> createState() => _State();
}

class _State extends State<Loginscreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  void loginUser() async {
    setState(() {
      isLoading = true;
    });
    String result = await Authentication().loginUser(
      name: nameController.text,
      password: passwordController.text,
      email: emailController.text,
    );

    if (result == "Success") {
      // Navigate to chat screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => chatScreen(name: nameController.text),
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
                child: Image.asset("image/login.jpg"),
              ),
              TextFieldinput(
                textEditingController: nameController,
                hintText: "Enter Your name",
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
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Forget password?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple,
                  ),
                ),
              ),
              button(
                onTab: loginUser,
                text: "Login",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have account?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "SIGNUP",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
