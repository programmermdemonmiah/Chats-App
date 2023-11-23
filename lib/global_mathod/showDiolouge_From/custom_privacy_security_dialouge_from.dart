import 'package:chats_app/Utils/colors.dart';
import 'package:chats_app/Widgets/custom_textformfild.dart';
import 'package:chats_app/core/Services/firebase_auth/firebase_password_services.dart';
import 'package:flutter/material.dart';

final _formkey = GlobalKey<FormState>();
final oldPassController = TextEditingController();
final newPassController = TextEditingController();
final reNewPassController = TextEditingController();

//showNameDialogAlert=====================
Future<void> showPasswordChangeDialogAlert(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: background,
        title: const Center(
          child: Text(
            'Update your Name',
            style: TextStyle(color: Colors.white),
          ),
        ),
        content: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                customTextFormField(
                  isPasswordField: true,
                  keyBoardInputType: TextInputType.text,
                  controller: oldPassController,
                  boldLabel: 'Old Password',
                  prefixIcon: Icons.lock,
                  hintText: 'enter your old password',
                  suffixIcon1: Icons.visibility,
                  suffixIcon2: Icons.visibility_off,
                ),
                customTextFormField(
                    keyBoardInputType: TextInputType.text,
                    controller: newPassController,
                    isPasswordField: true,
                    suffixIcon1: Icons.visibility,
                    suffixIcon2: Icons.visibility_off,
                    validator: (value) {
                      if (newPassController.text.toString() ==
                          reNewPassController.text.toString()) {
                        return null;
                      } else {
                        return "don't match your new password & re-type new password";
                      }
                    },
                    boldLabel: 'New password',
                    prefixIcon: Icons.lock,
                    hintText: 'enter your new password'),
                customTextFormField(
                  keyBoardInputType: TextInputType.text,
                  validator: (value) {
                    if (newPassController.text.toString() ==
                        reNewPassController.text.toString()) {
                      return null;
                    } else {
                      return "don't match your new password & re-type new password";
                    }
                  },
                  suffixIcon1: Icons.visibility,
                  suffixIcon2: Icons.visibility_off,
                  controller: reNewPassController,
                  boldLabel: 'Re-type New password',
                  prefixIcon: Icons.lock,
                  hintText: 'enter your new password',
                  isPasswordField: true,
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(backgroundColor: Colors.red),
            child: const Text(
              'cancel',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          TextButton(
            onPressed: () {
              if (_formkey.currentState!.validate()) {
                PasswordServices().changePassword(
                    oldPassController.text.toString(),
                    newPassController.text.toString());
              } else {
                return;
              }
            },
            style: TextButton.styleFrom(backgroundColor: primary),
            child: const Text(
              'ok',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      );
    },
  );
}
