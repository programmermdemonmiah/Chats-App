import 'dart:async';
import 'package:chats_app/Utils/colors.dart';
import 'package:chats_app/Views/home_Screen.dart';
import 'package:chats_app/core/session_controller_services/session_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../getStart/get_started_screen.dart';

class SpalashScreen extends StatefulWidget {
  const SpalashScreen({super.key});

  @override
  State<SpalashScreen> createState() => _SpalashScreenState();
}

class _SpalashScreenState extends State<SpalashScreen> {
  final auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    //Future.delayed or Timmer same work========
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => StreamBuilder<User?>( //login set kore rakhar niyom
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {// snapshot is a normal variable
                final user = auth.currentUser;
                if (snapshot.hasData && snapshot != null) {
                  SessionController().userId = user!.uid.toString();
                  return HomeScreen();
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.deepOrange, backgroundColor: Colors.greenAccent,),
                  );
                }
                return const GetStartedScreen();
              },
            ),
          ),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox.shrink(),
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/CA.png'),
                radius: 80,
              ),
              // Padding(
              //   padding: EdgeInsets.all(20.0),
              //   child: LinearProgressIndicator(
              //     color: Colors.blue,
              //     backgroundColor: Colors.green,
              //   ),
              // ),
              const SizedBox.shrink(),
              const SizedBox.shrink(),
              const SizedBox.shrink(),
              const SizedBox.shrink(),
              const SizedBox.shrink(),
              const CircularProgressIndicator(
                color: Colors.orange,
                backgroundColor: Colors.green,
              ),
              Column(
                children: [
                  Text(
                    "Created by 'programmermdemonmiah' ",
                    style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 16,fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10,)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
