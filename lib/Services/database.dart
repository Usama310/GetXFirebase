import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterbackend/Model/model.dart';
import 'package:flutterbackend/Model/todo.dart';

class DataBase {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _fireStore.collection("User").doc(user.id).set({
        "name": user.name,
        "email": user.email,
        "uid": user.id,
      });
      return true;
    } catch (e) {
      print(e.message);
      return false;
    }
  }

  Future<UserModel> getUser(String userUid) async {
    try {
      DocumentSnapshot doc =
          await _fireStore.collection("User").doc(userUid).get();
      return UserModel.fromDocumentSnapshot(doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> addTodo(String content, String uid) async {
    try {
      await _fireStore.collection("User").doc(uid).collection("Todos").add({
        "dataCreated": Timestamp.now(),
        "content": content,
        "done": false,
      });
    } catch (e) {}
  }

  Stream<List<TodoModel>> todoStream(String uid) {
    return _fireStore
        .collection("User")
        .doc(uid)
        .collection("Todos")
        .orderBy("dataCreated", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
          print(query.docs.length);
      List<TodoModel> retVal = [];
      query.docs.forEach((element) {
        retVal.add(TodoModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  Future<void> updateTodo(bool newValue, String uid, String todoId) async {
    try {
      _fireStore
          .collection("User")
          .doc(uid)
          .collection("Todos")
          .doc(todoId)
          .update({"done": newValue});
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
