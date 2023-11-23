
import 'package:chats_app/core/Services/firebase_auth/firebase_password_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PasswordStateController extends GetxController{
  final isTap = false.obs;
  final emailController = TextEditingController();
  // final _password = PasswordServices();

  Future<void> forgotPassword()async{
    String email = emailController.text.toString();
    isTap.value=!isTap.value;
   PasswordServices().forgotPassword(email);
  }

}