import 'package:flutterbackend/Controller/auth_Controller.dart';
import 'package:flutterbackend/Controller/user_Controller.dart';
import 'package:flutterbackend/Views/HomeScreen/homeScreen.dart';
import 'package:flutterbackend/Views/LoginScreen/LoginScreen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return GetX(
      initState: (_) {
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        if (Get.find<AuthController>().user != null) {
          return HomeScreen();
        } else {
          return LoginScreen();
        }
      },
    );

    /* Obx(() {
      return (Get.find<AuthController>().user != null
          ? HomeScreen()
          : LoginScreen());
    });*/
  }
}
