import 'package:chats_app/core/Services/firebase_auth/firebase_auth_services.dart';
import 'package:chats_app/Views/home_Screen.dart';
import 'package:chats_app/core/session_controller_services/session_controller.dart';
import 'package:chats_app/global_mathod/common/toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogRegStateController extends GetxController {
  var isTap = false.obs;
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  // FireStore Database ======
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final currentId = SessionController().userId.toString();

  //register database connet ===================================================
  Future<void> register() async {
    isTap.value = !isTap.value;
    String firstname = firstnameController.text;
    String lastname = lastnameController.text;
    String username = usernameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    isTap.value = !isTap.value;
    if (user != null) {
      Map<String, dynamic> usersData = {
        'uid': user.uid.toString(),
        'email': user.email.toString(),
        'username': usernameController.text.toString(),
        'first name': firstname.toString(),
        'last name': lastname.toString(),
        'profile_picture': '',
        'online status': 'status'
      };
     await firestore
          .collection('users')
          .doc(user.uid.toString())
          .set(usersData)
          .then((value) {
        showToast(message: 'User is successfully created');
        SessionController().userId = user.uid.toString();
        Get.until((route) => false);
        Get.to(HomeScreen());
      });
    } else {
      showToast(message: 'enter valid username');
    }
  }

  // login database =============================
  void login() async {
    isTap.value = !isTap.value;
    String email = emailController.text;
    String password = passwordController.text;
    User? user = await _auth.signInWithEmailAndPassword(email, password);
    isTap.value = !isTap.value;
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
