// import 'package:chats_app/Controllers/auth/session_controller/session_controller.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class SearchStateController extends GetxController{
//
//
//   DatabaseReference databaseRef = FirebaseDatabase.instance.ref().child('users');
//   TextEditingController userSearchController = TextEditingController();
//   List searchUserList = [].obs;
//
//   void userSearch(String name) async {
//     if (SessionController().userId.toString() ==
//         databaseRef.child('uid').toString()) {
//       return;
//     } else {
//       searchUserList = databaseRef as List;
//       print('Search done. Found ${searchUserList
//           .length} users matching the criteria.');
//     }
//   }
//
// }