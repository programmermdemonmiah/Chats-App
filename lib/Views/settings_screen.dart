
import 'package:chats_app/Utils/colors.dart';
import 'package:chats_app/Views/auth/login/login_screen.dart';
import 'package:chats_app/Widgets/custom_appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: customAppBar(tittle: 'Settigns', context: context),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Column(
             children: [
               ListTile(
                 onTap: () {},
                 leading: const CircleAvatar(
                   backgroundImage: NetworkImage(''),
                   radius: 60,
                   backgroundColor: primary,
                 ),
                 title: const Text(
                   'Your Name',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 18,
                       fontWeight: FontWeight.w500),
                 ),
                 subtitle: Text(
                   'username',
                   style: TextStyle(
                       color: Colors.white.withOpacity(0.5), fontSize: 17),
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
                  onTap: () {FirebaseAuth.instance.signOut(); Get.until((route) => false) ; Get.to(LoginScreen());},
                  child: const Text(
                    'Sign Out',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
