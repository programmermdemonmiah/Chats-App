import 'package:chats_app/Controllers/tab_state_controllers.dart';
import 'package:chats_app/Utils/app_text.dart';
import 'package:chats_app/Utils/colors.dart';
import 'package:chats_app/Views/Tabs/calls_tab.dart';
import 'package:chats_app/Views/Tabs/chats_tabs.dart';
import 'package:chats_app/Views/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // final MyTabs _tabs = Get.put(MyTabs());
  final _tabController = Get.put(MyTabs());

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
                title: const Text(
                  appBarTittle,
                  style: TextStyle(color: Colors.white),
                ),
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
                      switch (_tabController.tabController.index) {
                        case 0:
                          if (value == 1) {} else if (value == 2) {
                            Get.to( SettingsScreen());
                          } else {
                            Get.back();
                          }
                          break;
                        case 1:
                          if (value == 1) {
                            Get.to( SettingsScreen());
                          } else {
                            Get.back();
                          }
                      }
                    },
                    itemBuilder: (context) => _tabController.popUpItems,
                  )
                ],
                bottom: TabBar(
                    controller: _tabController.tabController,
                    indicatorColor: primary,
                    indicatorSize: TabBarIndicatorSize.tab,
                    unselectedLabelColor: Colors.white.withOpacity(0.5),
                    labelColor: primary,
                    tabs: _tabController.myTabs),
              )
            ];
          },
          body: TabBarView(
            // controller: _tabs.tabController,
            controller: _tabController.tabController,
            children: const [ChatsTab(), CallsTab()],
          ),
        ),
      ),

    );
  }
}
