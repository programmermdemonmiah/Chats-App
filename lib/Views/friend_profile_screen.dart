import 'package:chats_app/Utils/colors.dart';
import 'package:chats_app/Views/view_picture/view_picture_Screen.dart';
import 'package:chats_app/Widgets/custom_back_button.dart';
import 'package:chats_app/Widgets/custom_scafold.dart';
import 'package:chats_app/Widgets/settings_subpage/custom_profile_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FriendPfofileScreen extends StatelessWidget {
  String? profilePicture;
  String? name;
  String? username;
  String? phoneNumber;
  String? description;

  FriendPfofileScreen({super.key,
    required this.name,
    required this.username,
    required this.profilePicture,
    required this.phoneNumber,
    required this.description});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(body: Padding(
      padding: const EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customBackButton(context: context),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    profilePicture != ""
                        ? InkWell(
                      onTap: () {
                        Get.to(ViewPictureScreen(
                            profilePicture: profilePicture.toString()));
                      },
                      child: CircleAvatar(
                        backgroundImage:
                        NetworkImage(profilePicture!.toString()),
                        radius: 100,
                      ),
                    )
                        : Container(
                      height: 170,
                      width: 170,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ClipRect(
                          child: Icon(
                            Icons.person,
                            size: 90,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                  ],
                ),
                Divider(
                  thickness: 1.2,
                  color: Colors.white.withOpacity(0.3),
                  endIndent: 15,
                  indent: 15,
                ),
                customProfileItem(tittle: 'Name', context: context, subTittle: name.toString(), leadingIcon: Icons.person),
                customProfileItem(tittle: 'Username', context: context, leadingIcon: Icons.person, subTittle: username.toString()),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: phoneNumber.toString() == "null" ? const SizedBox.shrink() :Card(
                    color: appBarBg,shadowColor: Colors.white54.withOpacity(0.3), elevation: 7,
                    child: ListTile(
                      leading:  Icon(Icons.phone,color: Colors.white.withOpacity(0.5),),
                      title:  Text(phoneNumber.toString(), style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: description.toString() == "null" ? const SizedBox.shrink() :Card(
                    color: appBarBg,shadowColor: Colors.white54.withOpacity(0.3), elevation: 7,
                    child: ListTile(
                      leading: Icon(Icons.message, color: Colors.white.withOpacity(0.5),),
                      title:  Text(description.toString(), style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
    // return Scaffold(
    //   backgroundColor: background,
    //   body: SafeArea(
    //       child: Padding(
    //         padding: const EdgeInsets.all(6),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             customBackButton(context: context),
    //             SingleChildScrollView(
    //               physics: const BouncingScrollPhysics(),
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: [
    //                   Column(
    //                     crossAxisAlignment: CrossAxisAlignment.center,
    //                     children: [
    //                       profilePicture != ""
    //                           ? InkWell(
    //                         onTap: () {
    //                           Get.to(ViewPictureScreen(
    //                               profilePicture: profilePicture.toString()));
    //                         },
    //                         child: CircleAvatar(
    //                           backgroundImage:
    //                           NetworkImage(profilePicture!.toString()),
    //                           radius: 100,
    //                         ),
    //                       )
    //                           : Container(
    //                         height: 170,
    //                         width: 170,
    //                         decoration: const BoxDecoration(
    //                           shape: BoxShape.circle,
    //                           color: Colors.white,
    //                         ),
    //                         child: const Padding(
    //                           padding: EdgeInsets.all(8.0),
    //                           child: ClipRect(
    //                             child: Icon(
    //                               Icons.person,
    //                               size: 90,
    //                               color: Colors.black,
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                       const SizedBox(height: 20,),
    //                     ],
    //                   ),
    //                   Divider(
    //                     thickness: 1.2,
    //                     color: Colors.white.withOpacity(0.3),
    //                     endIndent: 15,
    //                     indent: 15,
    //                   ),
    //                   customProfileItem(tittle: 'Name', context: context, subTittle: name.toString(), leadingIcon: Icons.person),
    //                   customProfileItem(tittle: 'Username', context: context, leadingIcon: Icons.person, subTittle: username.toString()),
    //                   Padding(
    //                     padding: const EdgeInsets.symmetric(vertical: 2.0),
    //                     child: phoneNumber.toString() == "null" ? const SizedBox.shrink() :Card(
    //                       color: appBarBg,shadowColor: Colors.white54.withOpacity(0.3), elevation: 7,
    //                       child: ListTile(
    //                         leading:  Icon(Icons.phone,color: Colors.white.withOpacity(0.5),),
    //                         title:  Text(phoneNumber.toString(), style: const TextStyle(
    //                             color: Colors.white,
    //                             fontSize: 18,
    //                             fontWeight: FontWeight.w500),),
    //                       ),
    //                     ),
    //                   ),
    //                   Padding(
    //                     padding: const EdgeInsets.symmetric(vertical: 2.0),
    //                     child: description.toString() == "null" ? const SizedBox.shrink() :Card(
    //                       color: appBarBg,shadowColor: Colors.white54.withOpacity(0.3), elevation: 7,
    //                       child: ListTile(
    //                         leading: Icon(Icons.message, color: Colors.white.withOpacity(0.5),),
    //                         title:  Text(description.toString(), style: const TextStyle(
    //                             color: Colors.white,
    //                             fontSize: 18,
    //                             fontWeight: FontWeight.w500),),
    //                       ),
    //                     ),
    //                   )
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       )),
    // );
  }
}
