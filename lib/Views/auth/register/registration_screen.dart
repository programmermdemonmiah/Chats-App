import 'package:chats_app/Utils/colors.dart';
import 'package:chats_app/Widgets/custom_back_button.dart';
import 'package:chats_app/Widgets/custom_button.dart';
import 'package:chats_app/Widgets/custom_textformfild.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
          child: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customBackButton(context: context),
            Expanded(
                child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/CA.png'),
                    radius: 70,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'if you have any account go to back and login. or, don’t have any account flap the gap. and create account',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 16),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start ,
                        children: [
                          Expanded(
                            child: customTextFormField(
                              boldLabel: "First name",
                              hintText: "Enter your first name",
                              validator: (value) {

                              },
                            ),
                          ),
                          Expanded(child: customTextFormField(boldLabel: 'Last name', hintText: 'Enter your last name'))
                        ],
                      ),
                      // const SizedBox(height: 5,),
                      customTextFormField(boldLabel: 'Username', hintText: 'Enter a valid username', prefixIcon: Icons.person),
                      customTextFormField(boldLabel: 'Email', prefixIcon: Icons.person, hintText: "Enter your email"),
                      customTextFormField(boldLabel: 'Password', prefixIcon: Icons.lock,isPasswordField: true, hintText: 'Enter your password', suffixIcon1: Icons.visibility, suffixIcon2: Icons.visibility_off)
                    ],
                  ),
                  const SizedBox(height: 30,),
                  customButton(buttonName: 'Register', buttonColor: primary, context: context),
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}
