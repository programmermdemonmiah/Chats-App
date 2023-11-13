import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTabs extends GetxController with SingleGetTickerProviderMixin{
  late TabController tabController;
  final List<Tab> myTabs = <Tab> [
    const Tab(
      text: 'Chats',
    ),
    const Tab(
      text: 'Calls',
    )
  ];

  List<PopupMenuEntry<int>> popUpItems = [
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

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this)..addListener(() {
      switch(tabController.index){
        case 0:
          popUpItems = [
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
          popUpItems = [
            const PopupMenuItem(value: 1 , child: Text('Settings', style: TextStyle(color: Colors.white),))
          ];
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}










//
//
// //
// // List<PopupMenuEntry<int>> popUpItem = [
// //   const PopupMenuItem(
// //     value: 1,
// //     child: Text(
// //       'New group',
// //       style: TextStyle(color: Colors.white),
// //     ),
// //   ),
// //   const PopupMenuItem(
// //     value: 2,
// //     child: Text(
// //       'Settings',
// //       style: TextStyle(color: Colors.white),
// //     ),
// //   ),
// ];


// class TabStateControllers extends GetxController with SingleGetTickerProviderMixin{
//   late TabController tabController;
//   final popUpItems = [
//     [
//       const PopupMenuItem(
//         value: 1,
//         child: Text(
//           'New group',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       const PopupMenuItem(
//         value: 2,
//         child: Text(
//           'Settings',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//     ],
//     [
//       const PopupMenuItem(
//         value: 1,
//         child: Text(
//           'Settings',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//     ],
//   ].obs;
//   @override
//   void onInit() {
//     tabController = TabController(length: 2, vsync: this)..addListener(() {
//       updateMenuItems(tabController!.index);
//     });
//     super.onInit();
//   }
//   void updateMenuItems(int index) {
//     popUpItems.value = popUpItems[index].cast<List<PopupMenuItem<int>>>();
//   }
// }