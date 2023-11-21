import 'package:chats_app/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSizeWidget  customAppBar({required String tittle,IconData ? actionIcon, required BuildContext context}){
  return AppBar(
    backgroundColor: appBarBg,
    automaticallyImplyLeading: false,
    leading: IconButton(onPressed: () {
      Get.back();
    }, icon: const Icon(Icons.arrow_back_ios_new)),
    title: Text(tittle, style: const TextStyle(color: Colors.white),),
    actions: [
      IconButton(onPressed: () {

      }, icon: Icon(actionIcon, color: Colors.white,))
    ],
  );
}