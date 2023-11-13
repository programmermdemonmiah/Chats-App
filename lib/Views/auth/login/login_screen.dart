import 'package:chats_app/Utils/colors.dart';
import 'package:chats_app/Views/auth/register/register_screen.dart';
import 'package:chats_app/Widgets/custom_back_button.dart';
import 'package:chats_app/Widgets/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customBackButton(context: context),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage('assets/images/CA.png'),
                            radius: 70,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Login',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Login your account enter valid username or e-mail and password.',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 16),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const Text(
                                'Email',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 18),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              TextFormField(
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.person,
                                  ),
                                  hintText: 'Enter your email or username',
                                  hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.5)),
                                  // border: OutlineInputBorder(
                                  //   borderRadius: BorderRadius.circular(25),
                                  //   borderSide: BorderSide(
                                  //     width: 2,
                                  //     color: Colors.white,
                                  //   ),
                                  // ),
                                  enabled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: const BorderSide(
                                      width: 2,
                                      color: primary,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: const BorderSide(
                                      width: 2,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  focusColor: primary,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'Password',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 18),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              TextFormField(
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.lock),
                                  suffixIconColor: Colors.white70,
                                  suffixIcon: const Icon(Icons.visibility),
                                  hintText: 'Enter your password',
                                  hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.5)),
                                  // border: OutlineInputBorder(
                                  //   borderRadius: BorderRadius.circular(25),
                                  //   borderSide: BorderSide(
                                  //     width: 2,
                                  //     color: Colors.white,
                                  //   ),
                                  // ),
                                  enabled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: const BorderSide(
                                      width: 2,
                                      color: primary,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: const BorderSide(
                                      width: 2,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  focusColor: primary,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                alignment: Alignment.centerRight,
                                child: Tooltip(
                                  message:
                                      "If you have forgotten your password, you can recover the password",
                                  child: InkWell(
                                      onTap: () {},
                                      child: const Text(
                                        'Forgot Password?',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      )),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 150,),
                      Column(
                        children: [
                          customButton(
                              buttonName: 'Login',
                              buttonColor: primary,
                              context: context),
                          SizedBox(height: 10,),
                          RichText(
                              text: TextSpan(
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                  children: [
                                const TextSpan(
                                  text: "don't have any account? ",
                                ),
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.to(const RegisterScreen());
                                    },
                                  text: "Register",
                                  style: const TextStyle(
                                      color: primary, fontSize: 18),
                                )
                              ]))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
