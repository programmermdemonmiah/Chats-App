import 'package:chats_app/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget customBackButton ({required BuildContext context}){
  return InkWell(
    onTap: Get.back,
    child: Container(
      alignment: Alignment.center,
      height: 45,
      width: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: primary)
      ),
      child: const Icon(Icons.arrow_back_ios_new, color: Colors.white,),
    ),
  );
}