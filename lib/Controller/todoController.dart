import 'package:flutterbackend/Controller/auth_Controller.dart';
import 'package:flutterbackend/Model/todo.dart';
import 'package:flutterbackend/Services/database.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  Rx<List<TodoModel>> todoList = Rx<List<TodoModel>>();

  List<TodoModel> get todos => todoList.value;

  @override
  void onInit() {
    // TODO: implement onInit
    String uid = Get.find<AuthController>().userId;
    todoList.bindStream(DataBase().todoStream(uid));
    super.onInit();
  }
}
