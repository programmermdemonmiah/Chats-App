import 'package:chats_app/Controllers/profile/profile_controller.dart';
import 'package:chats_app/Utils/colors.dart';
import 'package:chats_app/Widgets/custom_textformfild.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final textFildTextController = Get.put(ProfileStateController());
final _formkey = GlobalKey<FormState>();
//showNameDialogAlert=====================
Future<void> showNameDialogAlert(BuildContext context) {
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
          child: Column(
            children: [
              customTextFormField(
                  keyBoardInputType: TextInputType.text,
                  controller: textFildTextController.firstnameController,
                  boldLabel: 'First Name',
                  prefixIcon: Icons.person,
                  hintText: 'enter your first name'),
              customTextFormField(
                  keyBoardInputType: TextInputType.text,
                  controller: textFildTextController.lastnameController,
                  boldLabel: 'Last Name',
                  prefixIcon: Icons.person,
                  hintText: 'enter your last name'),
            ],
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
              textFildTextController.updateName();
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

//showUsernameDialogAlert==============================
Future<void> showUsernameDialogAlert(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: background,
        title: const Center(
          child: Text(
            'Update your Username',
            style: TextStyle(color: Colors.white),
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formkey,
                child: customTextFormField(
                    validator: (usernameValue) {
                      DatabaseReference databaseRef = FirebaseDatabase.instance
                          .ref()
                          .child('users')
                          .child('username');
                      if (usernameValue!.isEmpty) {
                        return 'type vaild username';
                      } else if ( textFildTextController.usernameController.toString() ==
                          databaseRef.child('username').toString()) {
                        // == usernameValue.toString()
                        return 'Already used this username';
                      } else {
                        return null;
                      }
                    },
                    keyBoardInputType: TextInputType.text,
                    controller: textFildTextController.usernameController,
                    boldLabel: 'Username',
                    prefixIcon: Icons.person,
                    hintText: 'enter your username'),
              ),
            ],
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
                textFildTextController.updateUsername();
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

//showEmailDialogAlert========================================================
Future<void> showEmailDialogAlert(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: background,
        title: const Center(
          child: Text(
            'Update your email',
            style: TextStyle(color: Colors.white),
          ),
        ),
        content: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                customTextFormField(
                    keyBoardInputType: TextInputType.text,
                    controller: textFildTextController.emailController,
                    boldLabel: 'Email Address',
                    prefixIcon: Icons.alternate_email,
                    hintText: 'enter your email'),
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
              textFildTextController.updateEmail();
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

//========showPhoneNumberDialogAlert============================
Future<void> showPhoneNumberDialogAlert(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: background,
        title: const Center(
          child: Text(
            'Update your Phone Number',
            style: TextStyle(color: Colors.white),
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: [
              customTextFormField(
                  keyBoardInputType: TextInputType.text,
                  controller: textFildTextController.phonenumberController,
                  boldLabel: 'Phone Number',
                  prefixIcon: Icons.phone,
                  hintText: 'enter your phone number'),
            ],
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
              textFildTextController.updatePhoneNumber();
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

//===============showDescriptionDialogAlert==========================
Future<void> showDescriptionDialogAlert(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: background,
        title: const Center(
          child: Text(
            'Update your Description',
            style: TextStyle(color: Colors.white),
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: [
              customTextFormField(
                  keyBoardInputType: TextInputType.text,
                  controller: textFildTextController.descriptionController,
                  boldLabel: 'Description',
                  prefixIcon: Icons.message,
                  hintText: 'write description'),
            ],
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
              textFildTextController.updateDescription();
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
