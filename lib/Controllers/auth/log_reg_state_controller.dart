import 'package:chats_app/Controllers/auth/firebase_auth/firebase_auth_services.dart';
import 'package:chats_app/Views/home_Screen.dart';
import 'package:chats_app/Widgets/global_mathod/toast.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogRegStateController extends GetxController{
  var isSignInUp = false.obs;
  final FirebaseAuthService _auth = FirebaseAuthService();
   TextEditingController  firstnameController = TextEditingController();
   TextEditingController lastnameController = TextEditingController();
   TextEditingController usernameController = TextEditingController();
   TextEditingController emailController = TextEditingController();
   TextEditingController passwordController = TextEditingController();

  void register() async{
    isSignInUp.value = !isSignInUp.value;
    String firstname = firstnameController.text;
    String lastname = lastnameController.text;
    String username = usernameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    isSignInUp.value = !isSignInUp.value;
    if (user != null){
      showToast(message: 'User is successfully created');
      Get.until((route) => false) ;
      Get.to(HomeScreen());
    }else{
      showToast(message: 'some error happend');
    }
  }

  void login() async{
    isSignInUp.value = !isSignInUp.value;
    String email = emailController.text;
    String password = passwordController.text;
    User? user = await _auth.signInWithEmailAndPassword(email, password);
    isSignInUp.value = !isSignInUp.value;
    if (user != null){
      showToast(message: 'User is successfully signIn');
      Get.until((route) => false);
      Get.to(HomeScreen());
      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen(),), (route) => false);
    }else{
      showToast(message: 'some error happend');
    }
  }

}