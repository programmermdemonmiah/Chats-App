import 'dart:async';
import 'package:chats_app/Utils/colors.dart';
import 'package:chats_app/Views/home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpalashScreen extends StatefulWidget {
  const SpalashScreen({super.key});

  @override
  State<SpalashScreen> createState() => _SpalashScreenState();
}

class _SpalashScreenState extends State<SpalashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {Get.to(HomeScreen());});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/CA.png'),
                radius: 100,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: LinearProgressIndicator(
                  color: Colors.blue,
                  backgroundColor: Colors.green,
                ),
              ),
              Text("Created by 'programmermdemonmiah' ", style: TextStyle(color: Colors.white, fontSize: 18),),
            ],
          ),
        ),
      ),
    );
  }
}
