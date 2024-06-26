import 'package:chats_app/Controllers/auth/log_reg_state_controller.dart';
import 'package:chats_app/Utils/colors.dart';
import 'package:chats_app/Views/auth/login/login_screen.dart';
import 'package:chats_app/Widgets/custom_back_button.dart';
import 'package:chats_app/Widgets/custom_button.dart';
import 'package:chats_app/Widgets/custom_textformfild.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});

  final registerFormController = Get.put(LogRegStateController());

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
                            color: Colors.white.withOpacity(0.5), fontSize: 16),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: customTextFormField(
                              inputType: TextInputType.text,
                              controller: registerFormController.firstnameController,
                              boldLabel: "First name",
                              hintText: "Enter your first name",
                              // validator: (value) {},
                            ),
                          ),
                          Expanded(
                              child: customTextFormField(
                                  inputType: TextInputType.text,
                                controller: registerFormController.lastnameController,
                                  boldLabel: 'Last name',
                                  hintText: 'Enter your last name'))
                        ],
                      ),
                      // const SizedBox(height: 5,),
                      customTextFormField(
                        // validator: (value) {
                        //   DatabaseReference databaseRef = FirebaseDatabase.instance.ref().child('users').child('username');
                        //   if(databaseRef.toString() == registerFormController.usernameController.toString()){
                        //     return 'username not viald';
                        //   }else{
                        //     return null;
                        //   }
                        // },
                          inputType: TextInputType.text,
                          boldLabel: 'Username',
                          hintText: 'Enter a valid username',
                          controller: registerFormController.usernameController,
                          prefixIcon: Icons.person),
                      customTextFormField(
                          inputType: TextInputType.text,
                        controller: registerFormController.emailController,
                          boldLabel: 'Email',
                          prefixIcon: Icons.person,
                          hintText: "Enter your email"),
                      customTextFormField(
                          inputType: TextInputType.text,
                        controller: registerFormController.passwordController,
                          boldLabel: 'Password',
                          prefixIcon: Icons.lock,
                          isPasswordField: true,
                          hintText: 'Enter your password',
                          suffixIcon1: Icons.visibility,
                          suffixIcon2: Icons.visibility_off)
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  InkWell(
                      onTap: () {
                        registerFormController.register();
                      },
                      child: customButton(
                          buttonName:'Register',
                          buttonColor: primary,
                          context: context)),
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                      text: TextSpan(
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15),
                          children: [
                        const TextSpan(
                          text: "Already have an account? ",
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(LoginScreen());
                            },
                          text: "Login",
                          style: const TextStyle(color: primary, fontSize: 18),
                        )
                      ]))
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}
