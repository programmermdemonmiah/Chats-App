
import 'package:chats_app/Utils/colors.dart';
import 'package:chats_app/Utils/style.dart';
import 'package:chats_app/Widgets/custom_scafold.dart';
import 'package:chats_app/Widgets/custom_settings_item.dart';
import 'package:chats_app/global_mathod/showDiolouge_From/custom_privacy_security_dialouge_from.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyAndSecurityScreen extends StatelessWidget {
  const PrivacyAndSecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      hasAppBar: true,
        appBarTitle: Text('Privacy and Security', style: AppStyle.appBarStyle,),
        leading: InkWell(onTap: () => Get.back(), child: const Icon(Icons.arrow_back_ios_new, color: iconColor,)),
        body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              showPasswordChangeDialogAlert(context);
            },
            child: customSettingsItem(
              tittle: "change password", leadingIcon: Icons.key, subTittle: '',),
          ),
        ],
      ),
    ));
    // return Scaffold(
    //   appBar: customAppBar(tittle: 'Privacy and Security', context: context),
    //   backgroundColor: background,
    //   body: SafeArea(
    //       child: Padding(
    //     padding: const EdgeInsets.all(15.0),
    //     child: Column(
    //       children: [
    //         InkWell(
    //           onTap: () {
    //             showPasswordChangeDialogAlert(context);
    //           },
    //           child: customSettingsItem(
    //               tittle: "change password", leadingIcon: Icons.key, subTittle: '',),
    //         ),
    //       ],
    //     ),
    //   )),
    // );
  }
}
