import 'package:flutter/material.dart';
import 'package:flutterbackend/Controller/auth_Controller.dart';
import 'package:flutterbackend/Views/SignUpScreen/SignUpScreen.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<AuthController> {
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left:20,right: 20),
          child: Container(
            width: size.width,
            height: size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height*.3,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Enter Email",
                  ),
                ),
                SizedBox(
                  height: size.height * .1,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: "Password",
                  ),
                ),
                SizedBox(
                  height: size.height * .1,
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.login(emailController.text, passwordController.text);
                  },
                  child: Text("Login"),
                ),
                SizedBox(
                  height: size.height * .1,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(SignUpScreen());
                  },
                  child: Text("Sign Up"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
