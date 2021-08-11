import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterbackend/Controller/user_Controller.dart';
import 'package:flutterbackend/Model/model.dart';
import 'package:flutterbackend/Services/database.dart';
import 'package:flutterbackend/Views/HomeScreen/homeScreen.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _firebaseUser;

  String get user => _firebaseUser.value?.email;
  String get userId => _firebaseUser.value?.uid;

  @override
  void onInit() {
    _firebaseUser = Rx<User>(_auth.currentUser);
    // TODO: implement onInit
    _firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  void createUser(String email, String password, String name) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      UserModel _user = UserModel(
        id: _auth.currentUser.uid,
        name: name,
        email: email,
      );

      if (await DataBase().createNewUser(_user)) {

        Get.find<UserController>().user=_user;
        Get.to(HomeScreen());
      }
    } catch (e) {
      Get.snackbar("Error Message", e.message);
    }
  }

  void login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.find<UserController>().user = await DataBase().getUser(_auth.currentUser.uid);
    } catch (e) {
      Get.snackbar("Error Message", e.message);
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      Get.find<UserController>().dispose();
    } catch (e) {
      Get.snackbar("Error Message", e.message);
    }
  }
}
