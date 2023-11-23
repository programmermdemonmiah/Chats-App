import 'package:chats_app/Utils/colors.dart';
import 'package:chats_app/Views/auth/login/login_screen.dart';
import 'package:chats_app/Widgets/custom_button.dart';
import 'package:chats_app/Widgets/custom_scafold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotGiveLinkScreen extends StatelessWidget {
  const ForgotGiveLinkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: background,
    //   body: SafeArea(
    //       child: Padding(
    //     padding: const EdgeInsets.all(15.0),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         const SizedBox.shrink(),
    //         Image.asset('assets/icons/security.png', height: 150,),
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             const Text('Successfully password Give', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),),
    //             Text("you have successfully reset your password. Please check your email and re-set your password. \nThank you", style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 17),),
    //           ],
    //         ),
    //         InkWell(onTap: () {
    //           Get.until((route) => false);
    //           Get.to(LoginScreen());
    //           // Get.toNamed('/loginScreen');
    //         }, child: customButton(buttonName: 'Back to Login', buttonColor: primary, context: context)),
    //         const SizedBox.shrink(),
    //       ],
    //     ),
    //   ),
    //   ),
    // );
    return CustomScaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox.shrink(),
            Image.asset(
              'assets/icons/security.png',
              height: 150,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Successfully password Give',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "you have successfully reset your password. Please check your email and re-set your password. \nThank you",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5), fontSize: 17),
                ),
              ],
            ),
            InkWell(
                onTap: () {
                  Get.until((route) => false);
                  Get.to(LoginScreen());
                  // Get.toNamed('/loginScreen');
                },
                child: customButton(
                    buttonName: 'Back to Login',
                    buttonColor: primary,
                    context: context)),
            const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
