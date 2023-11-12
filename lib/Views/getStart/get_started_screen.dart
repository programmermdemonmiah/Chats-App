import 'package:chats_app/Utils/colors.dart';
import 'package:chats_app/Views/auth/log_reg_screen.dart';
import 'package:chats_app/Widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(height: 30,),
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/CA.png'),
                    radius: 80,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20,),
                      const Center(
                        child: Text(
                          'Welcome to ChatsApp',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Read our privacy policy. If you are agree then click Agree and continue",
                        style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 16),
                      )
                    ],
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Get.to(const LogRegScreen());
                },
                child: customButton(
                    buttonName: 'Agree and continue',
                    buttonColor: primary,
                    context: context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
