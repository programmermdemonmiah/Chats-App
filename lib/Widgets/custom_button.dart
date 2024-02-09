
import 'package:chats_app/Controllers/auth/log_reg_state_controller.dart';
import 'package:chats_app/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


Widget customButton({required String buttonName, required Color buttonColor, required BuildContext context}){
  final signInUpController = Get.put(LogRegStateController());
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Obx(() => Container(
      height: 45,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: primary, width: 2),
        color: buttonColor,
      ),
      child: signInUpController.isSignInUp.value == true? const CircularProgressIndicator(color: Colors.green,backgroundColor: Colors.orange,):Text(buttonName, style: const TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.w600),),
    )),
  );
}