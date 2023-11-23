import 'package:chats_app/Controllers/auth/session_controller/session_controller.dart';
import 'package:chats_app/Utils/colors.dart';
import 'package:chats_app/Views/auth/login/login_screen.dart';
import 'package:chats_app/Views/settigns/profile_screen.dart';
import 'package:chats_app/Widgets/custom_appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final databaseRef = FirebaseDatabase.instance.ref('users');

  // final map = Userdata;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: customAppBar(
          tittle: 'Settigns', context: context),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: StreamBuilder(
          stream: databaseRef
              .child(SessionController().userId.toString())
              .onValue,
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                  backgroundColor: Colors.greenAccent,
                ),
              );
            } else if (snapshot.hasData) {
              Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        onTap: () {
                          Get.to(ProfileScreen());
                        },
                        leading: map['profile_picture'].toString() == ""
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
                            map['profile_picture']),
                          radius: 35,
                        ),
                        title: Text(
                          "${map['first name']} ${map['last name']}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          map['username'],
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
                        )),
                  )
                ],
              );
            } else {
              return const Text('somthig eror');
            }
          },
        ),
      ),
    );
  }
}
