import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterbackend/Binding/auth_Binding.dart';
import 'package:flutterbackend/Utils/Root.dart';
import 'package:flutterbackend/Views/LoginScreen/LoginScreen.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Demo',
      theme: ThemeData.dark(),
      initialBinding: AuthBinding(),
      home:Root(),
    );
  }
}

