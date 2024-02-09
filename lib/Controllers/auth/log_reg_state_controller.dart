import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Views/home_Screen.dart';
import '../../core/Services/firebase_auth/firebase_auth_services.dart';
import '../../core/session_controller_services/session_controller.dart';
import '../../global_mathod/common/toast.dart';

class LogRegStateController extends GetxController {
  var isSignInUp = false.obs;
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //database
  DatabaseReference databaseRef =
      FirebaseDatabase.instance.ref().child('users');

  //register database connet ===================================================
  void register() async {
    isSignInUp.value = !isSignInUp.value;
    String firstname = firstnameController.text;
    String lastname = lastnameController.text;
    String username = usernameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    isSignInUp.value = !isSignInUp.value;
    if (username.toString() != databaseRef.child("username").toString() &&
        username.toString() != null &&
        user != null) {
      databaseRef.child(user!.uid.toString()).set({
        'uid': user!.uid.toString(),
        'email': user!.email.toString(),
        'username': usernameController.text.toString(),
        'first name': firstname.toString(),
        'last name': lastname.toString(),
        'profile_picture': '',
        'online status': 'status',
      }).then((value) {
        showToast(message: 'User is successfully created');
        SessionController().userId = user.uid.toString();
        Get.until((route) => false);
        Get.to(HomeScreen());
      });
    } else if (username.toString() ==
        databaseRef.child("username").toString()) {
      showToast(message: 'Already used this username');
    } else {
      showToast(message: 'enter valid username');
    }
  }

  // login database =============================
  void login() async {
    isSignInUp.value = !isSignInUp.value;
    String email = emailController.text;
    String password = passwordController.text;
    User? user = await _auth.signInWithEmailAndPassword(email, password);
    isSignInUp.value = !isSignInUp.value;
    if (user != null) {
      showToast(message: 'User is successfully signIn');
      SessionController().userId = user.uid.toString();
      Get.until((route) => false);
      Get.to(HomeScreen());
      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen(),), (route) => false);
    } else {
      showToast(message: 'some error happend');
    }
  }
}
