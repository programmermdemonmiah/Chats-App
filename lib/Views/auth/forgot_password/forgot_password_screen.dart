import 'package:chats_app/Controllers/auth/passwrod_state_controller.dart';
import 'package:chats_app/Utils/colors.dart';
import 'package:chats_app/Widgets/custom_back_button.dart';
import 'package:chats_app/Widgets/custom_button.dart';
import 'package:chats_app/Widgets/custom_textformfild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final _forgotPassController = Get.put(PasswordStateController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customBackButton(context: context),
                Center(
                    child: Image.asset('assets/icons/forgot.png', height: 120)),
              ],
            ),
            const SizedBox.shrink(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Forgot Password?', style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),),
                const SizedBox(height: 5,),
                Text(
                  "Dont’ worry! It occurs, Please enter the email address linked with your account.",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5), fontSize: 17),),
              ],
            ),
            Column(
              children: [
                Form(
                  key: _formKey,
                  child: customTextFormField(
                      boldLabel: 'Email',
                      validator: (value) {
                        if (value
                            .toString()
                            .isEmail) {
                          return null;
                        } else {
                          return 'please type your email';
                        }
                      },
                      controller: _forgotPassController.emailController,
                      hintText: 'enter your email',
                      keyBoardInputType: TextInputType.emailAddress),
                ),
                InkWell(onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _forgotPassController.forgotPassword();
                  } else {
                    return;
                  }
                },
                    child: customButton(buttonName: 'Send code',
                        buttonColor: primary,
                        context: context)),
              ],
            ),
            const SizedBox.shrink(),
          ],
        ),
      )),
    );
  }
}
