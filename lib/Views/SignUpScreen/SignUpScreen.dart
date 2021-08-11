import 'package:flutter/material.dart';
import 'package:flutterbackend/Controller/auth_Controller.dart';
import 'package:flutterbackend/Views/LoginScreen/LoginScreen.dart';
import 'package:get/get.dart';

class SignUpScreen extends GetWidget<AuthController> {
  final TextEditingController emailField = new TextEditingController();
  final TextEditingController nameField = new TextEditingController();
  final TextEditingController passwordField = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:  SingleChildScrollView(
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
                controller: nameField,
                decoration: InputDecoration(
                  hintText: "Enter name",
                ),
              ),
              SizedBox(
                height: size.height * .1,
              ),
              TextFormField(
                controller: emailField,
                decoration: InputDecoration(
                  hintText: "Enter Email",
                ),
              ),
              SizedBox(
                height: size.height * .1,
              ),
              TextFormField(
                controller: passwordField,
                decoration: InputDecoration(
                  hintText: "Enter Password",
                ),
              ),
              SizedBox(
                height: size.height * .1,
              ),
              ElevatedButton(
                onPressed: () {
                  controller.createUser(emailField.text, passwordField.text,nameField.text);

                },
                child: Text("Sign UP"),
              ),
              SizedBox(
                height: size.height * .1,
              ),

            ],
          ),
        ),
      ),),
    );
  }
}
