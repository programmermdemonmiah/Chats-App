
import 'package:chats_app/Utils/colors.dart';
import 'package:chats_app/Views/auth/login/login_screen.dart';
import 'package:chats_app/Views/auth/register/registration_screen.dart';
import 'package:chats_app/Widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogRegScreen extends StatelessWidget {
  const LogRegScreen({super.key});

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
                  const SizedBox(height: 20,),
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/CA.png'),
                    radius: 90,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 35,),
                      const Text(
                        'Ensure Login or Register',
                        style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "If you are already create an account, click Login. If you don't have any account you can register a account.",
                        style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 16),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(const LoginScreen());
                    },
                    child: customButton(
                        buttonName: 'Login',
                        buttonColor: primary,
                        context: context),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const RegistrationScreen());
                    },
                    child: customButton(
                        buttonName: 'Registration',
                        buttonColor: primary,
                        context: context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
