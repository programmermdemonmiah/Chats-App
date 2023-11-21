import 'package:chats_app/Controllers/auth/log_reg_state_controller.dart';
import 'package:chats_app/Utils/colors.dart';
import 'package:chats_app/Views/auth/register/registration_screen.dart';
import 'package:chats_app/Widgets/custom_back_button.dart';
import 'package:chats_app/Widgets/custom_button.dart';
import 'package:chats_app/Widgets/custom_textformfild.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final logInformController = Get.put(LogRegStateController());
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
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600),
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
                              customTextFormField(
                                inputType: TextInputType.text,
                                controller: logInformController.emailController,
                                  boldLabel: 'Email',
                                  prefixIcon: Icons.person,
                                  hintText: 'Enter your email'),
                              customTextFormField(
                                  inputType: TextInputType.text,
                                controller: logInformController.passwordController,
                                  boldLabel: 'Password',
                                  isPasswordField: true,
                                  prefixIcon: Icons.lock,
                                  suffixIcon1: Icons.visibility,
                                  suffixIcon2: Icons.visibility_off,
                                  hintText: 'Enter your password'),
                              const SizedBox(height: 5,),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                      const SizedBox(
                        height: 140,
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              logInformController.login();
                            },
                            child: customButton(
                                buttonName: 'Login',
                                buttonColor: primary,
                                context: context),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
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
                                      Get.to( RegistrationScreen());
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
