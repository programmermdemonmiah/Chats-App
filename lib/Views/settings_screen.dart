import 'package:chats_app/Utils/style.dart';
import 'package:chats_app/Views/settigns/Security_Screen.dart';
import 'package:chats_app/Widgets/custom_scafold.dart';
import 'package:chats_app/Widgets/custom_settings_item.dart';
import 'package:chats_app/core/session_controller_services/session_controller.dart';
import 'package:chats_app/Views/auth/login/login_screen.dart';
import 'package:chats_app/Views/settigns/profile_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  // final databaseRef = FirebaseDatabase.instance.ref('users');
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final currentId = FirebaseAuth.instance.currentUser!.uid.toString();

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: background,
    //   appBar: customAppBar(
    //       tittle: 'Settigns', context: context),
    //   body: Container(
    //     height: double.infinity,
    //     width: double.infinity,
    //     padding: const EdgeInsets.symmetric(vertical: 8),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Column(
    //           children: [
    //             StreamBuilder<DocumentSnapshot>(
    //               stream: fireStore.collection('users').doc(FirebaseAuth.instance.currentUser!.uid.toString()).snapshots(),
    //               builder: (context,AsyncSnapshot snapshot) {
    //                 if (snapshot.hasData) {
    //                   if(snapshot.connectionState == ConnectionState.waiting) {
    //                     return const Center(
    //                       child: CircularProgressIndicator(
    //                         color: Colors.orange,
    //                         backgroundColor: Colors.greenAccent,
    //                       ),
    //                     );
    //                   }else{
    //                     Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
    //                     return Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         ListTile(
    //                           onTap: () {
    //                             Get.to(ProfileScreen());
    //                           },
    //                           leading: data['profile_picture'].toString() == ""
    //                               ? Container(
    //                             alignment: Alignment.center,
    //                             height: 70,
    //                             width: 70,
    //                             decoration: const BoxDecoration(
    //                               shape: BoxShape.circle,
    //                               color: Colors.white,
    //                             ),
    //                             child: const Padding(
    //                               padding: EdgeInsets.all(8.0),
    //                               child: Icon(
    //                                 Icons.person,
    //                                 size: 40,
    //                                 color: Colors.black,
    //                               ),
    //                             ),
    //                           ) : CircleAvatar(
    //                             backgroundImage: NetworkImage(
    //                                 data['profile_picture'].toString()),
    //                             radius: 35,
    //                           ),
    //                           title: Text(
    //                             "${data['first name']} ${data['last name']}",
    //                             style: const TextStyle(
    //                                 color: Colors.white,
    //                                 fontSize: 18,
    //                                 fontWeight: FontWeight.w500),
    //                           ),
    //                           subtitle: Text(
    //                             data['username'],
    //                             style: TextStyle(
    //                                 color: Colors.white.withOpacity(0.5),
    //                                 fontSize: 17),
    //                           ),
    //                           trailing: IconButton(
    //                               onPressed: () {},
    //                               icon: Icon(
    //                                 Icons.arrow_forward_ios,
    //                                 color: Colors.white.withOpacity(0.8),
    //                               )),
    //                         ),
    //                         const SizedBox(
    //                           height: 5,
    //                         ),
    //                         Divider(
    //                           color: Colors.white.withOpacity(0.5),
    //                           thickness: 1.2,
    //                         ),
    //                         const SizedBox(height: 7),
    //                       ],
    //                     );
    //                   }
    //                 } else if (snapshot.hasError) {
    //                  return Text('network error');
    //                 } else {
    //                   return Center(child: const Text('somthig eror', style: TextStyle(color: Colors.white),));
    //                 }
    //               },
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.symmetric(horizontal: 15.0),
    //               child: Column(
    //                 children: [
    //                   InkWell(onTap: () {
    //                     Get.to(PrivacyAndSecurityScreen());
    //                   }, child: customSettingsItem(tittle: 'Privacy & Security', subTittle: "Account Privacy & Security", leadingIcon: Icons.lock)),
    //                 ],
    //               ),
    //             )
    //           ],
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.only(bottom: 30),
    //           child: InkWell(
    //               onTap: () {
    //                 FirebaseAuth.instance.signOut();
    //                 SessionController().userId = '';
    //                 Get.until((route) => false);
    //                 Get.to(LoginScreen());
    //               },
    //               child: const Text(
    //                 'Sign Out',
    //                 style: TextStyle(
    //                     color: Colors.red,
    //                     fontSize: 20,
    //                     fontWeight: FontWeight.w600),
    //               ))
    //         )
    //       ],
    //     ),
    //   ),
    // );
    return CustomScaffold(
      hasAppBar: true,
      appBarTitle: Text('Settigns', style: AppStyle.appBarStyle),
      leading: InkWell(onTap: () => Get.back(), child: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white,)),
      body: Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              StreamBuilder<DocumentSnapshot>(
                stream: fireStore.collection('users').doc(FirebaseAuth.instance.currentUser!.uid.toString()).snapshots(),
                builder: (context,AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if(snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.orange,
                          backgroundColor: Colors.greenAccent,
                        ),
                      );
                    }else{
                      Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            onTap: () {
                              Get.to(ProfileScreen());
                            },
                            leading: data['profile_picture'].toString() == ""
                                ? Container(
                              alignment: Alignment.center,
                              height: 70,
                              width: 70,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.person,
                                  size: 40,
                                  color: Colors.black,
                                ),
                              ),
                            ) : CircleAvatar(
                              backgroundImage: NetworkImage(
                                  data['profile_picture'].toString()),
                              radius: 35,
                            ),
                            title: Text(
                              "${data['first name']} ${data['last name']}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            subtitle: Text(
                              data['username'],
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 17),
                            ),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white.withOpacity(0.8),
                                )),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Divider(
                            color: Colors.white.withOpacity(0.5),
                            thickness: 1.2,
                          ),
                          const SizedBox(height: 7),
                        ],
                      );
                    }
                  } else if (snapshot.hasError) {
                    return Text('network error');
                  } else {
                    return Center(child: const Text('somthig eror', style: TextStyle(color: Colors.white),));
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    InkWell(onTap: () {
                      Get.to(const PrivacyAndSecurityScreen());
                    }, child: customSettingsItem(tittle: 'Privacy & Security', subTittle: "Account Privacy & Security", leadingIcon: Icons.lock)),
                  ],
                ),
              )
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: InkWell(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    SessionController().userId = '';
                    Get.until((route) => false);
                    Get.to(LoginScreen());
                  },
                  child: const Text(
                    'Sign Out',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ))
          )
        ],
      ),
    ),);
  }
}
