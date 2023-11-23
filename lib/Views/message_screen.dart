import 'dart:collection';

import 'package:chats_app/Controllers/auth/session_controller/session_controller.dart';
import 'package:chats_app/Controllers/message_controller.dart';
import 'package:chats_app/Utils/colors.dart';
import 'package:chats_app/Views/home_Screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageScreen extends StatelessWidget {
  String name;
  String username;
  String receiverId;
  String profilePicture;

  MessageScreen(
      {super.key,
      required this.name,
      required this.username,
      required this.receiverId,
      required this.profilePicture});

  final _messageController = Get.put(MessageStateController());
  DatabaseReference messageRef = FirebaseDatabase.instance.ref().child('chats');
  final senderId = SessionController().userId.toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: appBarBg,
        automaticallyImplyLeading: false,
        leading: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          child: InkWell(
            onTap: () {
              Get.to(HomeScreen());
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Positioned(
                  left: 1,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(width: 2, color: primary.withOpacity(0.8)),
                    ),
                    child: profilePicture == ""
                        ? const ClipRect(
                            child: Icon(
                              Icons.person,
                              size: 35,
                              color: Colors.white,
                            ),
                          )
                        : CircleAvatar(
                            backgroundImage: NetworkImage(profilePicture),
                            radius: 30,
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
        title: ListTile(
          title: Text(
            name,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
          ),
          subtitle: Text(
            username,
            style:
                TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 18),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.call,
                color: Colors.white,
                size: 25,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.video_call,
                color: Colors.white,
                size: 25,
              )),
          PopupMenuButton(
            color: appBarBg.withOpacity(0.6),
            shadowColor: appBarBg,
            offset: const Offset(0, 48),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: 1,
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 20,
                ),
              )
            ],
            onSelected: (value) {
              if (value == 1) {
                // Get.to();
              } else {
                Get.back();
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: StreamBuilder(
                stream: _messageController.getMessages(senderId, receiverId),
                builder: (context, snapshot) {
                  Map<String, dynamic> data = messageRef.child('chats') as Map<String, dynamic>;
                  var alignment = (data['sender'] == SessionController().userId.toString()) ? Alignment.centerRight : Alignment.centerLeft;
                  return Container(
                    alignment: alignment,
                    child: Text('message', style: TextStyle(color: Colors.white),),
                  );
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 7, bottom: 12, left: 7, right: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      decoration: BoxDecoration(
                          color: appBarBg,
                          borderRadius: BorderRadius.circular(25)),
                      child: TextFormField(
                        controller: _messageController.messageController,
                        minLines: 1,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'typing your message',
                          hintStyle:
                              TextStyle(color: Colors.white.withOpacity(0.4)),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: primary,
                    child: IconButton(
                      onPressed: () {
                        _messageController.sendMessage(receiverId);
                      },
                      icon: const ClipRect(
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// FirebaseAnimatedList(
// query: messageRef,
// itemBuilder: (context, snapshot, animation, index) {
// final message = snapshot.child('message').value.toString();
// final sender = snapshot.child('sender').value.toString();
// final receiver = snapshot.child('receiver').value.toString();
// final time = snapshot.child('time').value.toString();
// final type = snapshot.child('type').value.toString();
// final isSeen = snapshot.child('sender');
//
// return Column(
// crossAxisAlignment: _messageController.isSendMessage == true ? CrossAxisAlignment.end : CrossAxisAlignment.start,
// children: [
// ],
// );
// },
// ),
