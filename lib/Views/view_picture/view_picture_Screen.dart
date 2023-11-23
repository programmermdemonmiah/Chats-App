import 'package:chats_app/Utils/colors.dart';
import 'package:chats_app/Widgets/custom_back_button.dart';
import 'package:flutter/material.dart';

class ViewPictureScreen extends StatelessWidget {
  String profilePicture;
   ViewPictureScreen({super.key, required this.profilePicture});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customBackButton(context: context),
          const SizedBox(height: 2,),
          Center(
            child: Container(
              alignment: Alignment.center,
              height: size.height/1.15,
              width: size.width/1.02,
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Image(image: NetworkImage(profilePicture) , fit: BoxFit.cover,),
            ),
          )
        ],
      )),
    );
  }
}
