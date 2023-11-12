import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<PopupMenuEntry<int>> popUpItem = [
 const PopupMenuItem(
  value: 1,
  child: Text(
   'New group',
   style: TextStyle(color: Colors.white),
  ),
 ),
 const PopupMenuItem(
  value: 2,
  child: Text(
   'Settings',
   style: TextStyle(color: Colors.white),
  ),
 ),
];
class TabControllersState extends GetxController{
 TabController ? _tabController;

 void tabControllers(){
   switch(_tabController!.index){
    case 0:
     popUpItem = [
      const PopupMenuItem(
       value: 1,
       child: Text(
        'New group',
        style: TextStyle(color: Colors.white),
       ),
      ),
      const PopupMenuItem(
       value: 2,
       child: Text(
        'Settings',
        style: TextStyle(color: Colors.white),
       ),
      ),
     ];
     break;
    case 1:
     popUpItem = [
      const PopupMenuItem(
       value: 1,
       child: Text(
        'Settings',
        style: TextStyle(color: Colors.white),
       ),
      ),
     ];
     break;
   }
 }
}
