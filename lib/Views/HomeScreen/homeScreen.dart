import 'package:flutter/material.dart';
import 'package:flutterbackend/Controller/auth_Controller.dart';
import 'package:flutterbackend/Controller/todoController.dart';
import 'package:flutterbackend/Controller/user_Controller.dart';
import 'package:flutterbackend/Services/database.dart';
import 'package:flutterbackend/Widget/todoCard.dart';
import 'package:get/get.dart';

class HomeScreen extends GetWidget<AuthController> {
  final UserController _userController=Get.find<UserController>();
  final TextEditingController _todoController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _userController.user.name == null?"Loading":_userController.user.name,
        ),
         actions: [
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               IconButton(
                 onPressed: () {},
                 icon: Icon(
                   Icons.edit_rounded
                 ),
               ),

               IconButton(
                 onPressed: () {
                   controller.signOut();
                 },
                 icon: Icon(
                     Icons.logout,
                 ),
               ),
             ],
           ),
         ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            "Add Todo Here:",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Card(
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _todoController,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      if (_todoController.text != "") {
                        DataBase()
                            .addTodo(_todoController.text, controller.userId);
                        _todoController.clear();
                      }
                    },
                  )
                ],
              ),
            ),
          ),
          Text(
            "Your Todos",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          GetX<TodoController>(
            init: Get.put<TodoController>(TodoController()),
            builder: (TodoController todoController) {
              if (todoController != null && todoController.todos != null) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: todoController.todoList.value.length,
                    itemBuilder: (_, index) {
                      return TodoCard(
                          uid: controller.userId,
                          todo: todoController.todoList.value[index]);
                    },
                  ),
                );
              } else {
                return Text("loading...");
              }
            },
          )
        ],
      ),
    );
  }
}
