import 'package:chats_app/Controllers/tab_state_controllers.dart';
import 'package:chats_app/Utils/apptext.dart';
import 'package:chats_app/Utils/colors.dart';
import 'package:chats_app/Views/Tabs/calls_tab.dart';
import 'package:chats_app/Views/Tabs/chats_tabs.dart';
import 'package:chats_app/Views/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

   final tabController = Get.put(TabControllersState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: appBarBg,
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                title: const Text(appBarTittle, style: TextStyle(color: Colors.white),),
                actions: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                  PopupMenuButton(
                    offset: const Offset(0, 48),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                    color: appBarBg,
                    onSelected: (value) {
                      if(value == 1){

                      }else if(value == 2){
                        Get.to(const SettingsScreen());
                      }else {Get.back();}
                    },
                      itemBuilder: (context) {
                        return popUpItem;
                      },
                  ),
                ],
                bottom: TabBar(
                    indicatorColor: primary,
                    indicatorSize: TabBarIndicatorSize.tab,
                    unselectedLabelColor: Colors.white.withOpacity(0.5),
                    labelColor: primary,
                    tabs: const [
                      Tab(
                        child: Text('Chats', style: TextStyle(color: Colors.white),),
                      ),
                      Tab(
                        child: Text('Calls', style: TextStyle(color: Colors.white),),
                      ),
                    ]),
              )
            ];
          },
          body: TabBarView(
            controller: tabController,
            children: const [
              ChatsTab(),
              CallsTab(),
            ],
          ),
        ),
      ),
    );
  }
}
