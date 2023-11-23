import 'package:chats_app/Controllers/auth/session_controller/session_controller.dart';
import 'package:chats_app/Utils/colors.dart';
import 'package:chats_app/Views/message_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  BuildContext context;

  SearchScreen({super.key, required this.context});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final DatabaseReference databaseRef =
      FirebaseDatabase.instance.ref().child('users');

  // final searchController = Get.put(SearchStateController());

  final TextEditingController userSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 7, right: 7,bottom: 10, top: 5),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    // padding: const EdgeInsets.symmetric(horizontal: 0),
                    decoration: BoxDecoration(
                      color: appBarBg,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: TextFormField(
                      maxLines: 1,
                      controller: userSearchController,
                      onChanged: (value) {
                        // searchController.userSearch(value)
                        setState(() {});
                      },
                      style: const TextStyle(
                          color: Colors.white, fontSize: 18),
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                              size: 25,
                            )),
                        hintText: 'search user',
                        hintStyle:
                            TextStyle(color: Colors.white.withOpacity(0.5)),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                // SizedBox.shrink(),
                // Divider(
                //   thickness: 1.2,
                //   height: 0.1,
                //   color: Colors.white.withOpacity(0.4),
                // ),
                // const SizedBox(height: 8),
              ],
            ),


            Expanded(
              // child: Obx(() => ListView.builder(
              //   shrinkWrap: true,
              //   primary: false,
              //   itemCount: searchController.searchUserList.length,
              //   physics: const BouncingScrollPhysics(),
              //   itemBuilder: (context, index) {
              //     final data = searchController.searchUserList[index];
              //     return Card(
              //       color: appBarBg,
              //       margin: const EdgeInsets.symmetric(vertical: 3),
              //       elevation: 30,
              //       shadowColor: Colors.white70.withOpacity(0.2),
              //       child: ListTile(
              //         title: Text("Emon", style: TextStyle(color: Colors.white),),
              //         subtitle: Text(data('username'), style: TextStyle(color: Colors.white.withOpacity(0.5)),),
              //       ),
              //     );
              //   },
              // )),

              // StreamBuilder(
              //   stream: databaseRef.onValue,
              //   builder: (context, AsyncSnapshot snapshot) {
              //     return ListView.builder(
              //       physics: const BouncingScrollPhysics(),
              //       shrinkWrap: true,
              //       primary: false,
              //       itemBuilder: (context, index) {
              //         Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
              //         return Card(
              //           elevation: 50,
              //           shadowColor: Colors.white54.withOpacity(0.3),
              //           margin: const EdgeInsets.symmetric(vertical: 2),
              //           color: appBarBg,
              //           child: ListTile(
              //             leading: map['profile_picture'].toString() == ""
              //                 ? Container(
              //                     alignment: Alignment.center,
              //                     height: 70,
              //                     width: 70,
              //                     decoration: const BoxDecoration(
              //                       shape: BoxShape.circle,
              //                       color: Colors.white,
              //                     ),
              //                     child: const Padding(
              //                       padding: EdgeInsets.all(8.0),
              //                       child: Icon(
              //                         Icons.person,
              //                         size: 40,
              //                         color: Colors.black,
              //                       ),
              //                     ),
              //                   )
              //                 : CircleAvatar(
              //                     backgroundImage:
              //                         NetworkImage(map['profile_picture']),
              //                     radius: 35,
              //                   ),
              //             title: Text(
              //               "${map['first name']} ${map['last name']}",
              //               style: const TextStyle(color: Colors.white),
              //             ),
              //             subtitle: Text(
              //               map['username'],
              //               style:
              //                   TextStyle(color: Colors.white.withOpacity(0.5)),
              //             ),
              //           ),
              //         );
              //       },
              //     );
              //   },
              // ),
              child: FirebaseAnimatedList(
                query: databaseRef,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, snapshot, animation, index) {
                  final name =
                      "${snapshot.child("first name").value} ${snapshot.child("last name").value}";
                  final username = snapshot.child("username").value.toString();
                  final profilePicture =
                      snapshot.child('profile_picture').value.toString();
                  final messageToUid = snapshot.child('uid').value.toString();

                  if(SessionController().userId.toString() == snapshot.child('uid').value.toString()){
                    return const SizedBox.shrink();
                  }else{
                    if (userSearchController.text.isEmpty || name.toLowerCase().contains(userSearchController.text.toLowerCase())) {
                      return Card(
                        elevation: 10,
                        shadowColor: Colors.white54.withOpacity(0.3),
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        color: appBarBg,
                        child: ListTile(
                          onTap: () {
                            Get.to(MessageScreen(name: name, username: username, receiverId: messageToUid, profilePicture: profilePicture,));
                          },
                          leading: Container(
                            alignment: Alignment.center,
                            height: 70,
                            width: 70,
                            decoration:  BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 2, color: Colors.green),
                            ),
                            child: profilePicture == ""
                                ? Center(
                                  child: const Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.white,
                            ),
                                )
                                : CircleAvatar(
                              backgroundImage: NetworkImage(profilePicture),
                              radius: 35,
                            ),
                          ),
                          title: Text(name,
                              style: const TextStyle(color: Colors.white)),
                          subtitle: Text(username,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.5))),
                        ),
                      );
                    } else {
                      return SizedBox.shrink(); // Hide items that don't match the search criteria
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
