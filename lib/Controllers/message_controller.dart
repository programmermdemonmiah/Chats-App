
import 'package:audioplayers/audioplayers.dart';
import 'package:chats_app/Model/last_message_update.dart';
import 'package:chats_app/Model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MessageStateController extends GetxController {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  TextEditingController messageController = TextEditingController();
  // final isSendMessage = false.obs;
  final isUpadateMessage = false.obs;
  final currentUserId = FirebaseAuth.instance.currentUser!.uid.toString();

 final lastMessageDetails= [].obs;
  String ? time;
  String  message = "";
  String ? chatUserId;

//send message ====================
  Future<void> sendMessage(String receiverId) async {
    // isSendMessage.value = !isSendMessage.value;
    isUpadateMessage.value = !isUpadateMessage.value;
    List<String> ids = [currentUserId, receiverId];
    ids.sort();
    String chatRoomId = ids.join("_");
    //=====
    if (messageController.text.isEmpty) {
      return;
    } else {
      message = messageController.text.toString();
      String lastMessage = messageController.text.toString();
      messageController.clear();
      //time.now========
      final timeStamp = DateTime.now();
      // Define a DateFormat to format the date and time
      DateFormat dateFormat = DateFormat('hh:mm a');
      time = dateFormat.format(timeStamp);
      //===offline======
      chatUserId = chatRoomId;
      lastMessageDetails.add(LastMessageUpdate(lastMessage: lastMessage, time: time.toString(), chatRoomId: chatRoomId));
      //====online===
      Message newMessage = Message(
          isSeen: false,
          message: message.toString(),
          receiverId: receiverId,
          senderId: currentUserId,
          timeStamp: timeStamp,
          type: 'text');

      await _fireStore
          .collection('chats')
          .doc(chatRoomId)
          .collection('messages')
          .add(newMessage.toMap())
          .then((value) {
        isUpadateMessage.value = !isUpadateMessage.value;
        message = "";
      }).then((value) {
        _fireStore.collection('users').doc(currentUserId).update({
          "chatRoomId": chatRoomId,
          "lastMessage" : lastMessage,
          "timeStamp" : timeStamp,
        });
        _fireStore.collection('users').doc(receiverId).update({
          "chatRoomId": chatRoomId,
          "lastMessage" : lastMessage,
          "timeStamp" : timeStamp,
        });
      });
    }
  }

  //get message =====================
  Stream<QuerySnapshot> getMessage(String currentUserId, String receiverId) {
    List<String> ids = [currentUserId, receiverId];
    ids.sort();
    String chatRoomId = ids.join("_");
    return _fireStore
        .collection('chats')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timeStamp', descending: false)
        .snapshots();

  }

  //seen update ================

  Future<void> seenUpdate(String receiverId) async{
    List<String> ids = [currentUserId, receiverId];
    ids.sort();
    String chatRoomId = ids.join("_");
    await _fireStore.collection('chats').doc(chatRoomId).collection('messages').doc().update({
      "isSeen" : true,
    }).then((value) {
      print('update seen');
    });
}


  final messageFocus = FocusNode();
  final messageSendButtonFocus = FocusNode();
  @override
  void onClose() {
    super.onClose();
    messageFocus.dispose();
    messageSendButtonFocus.dispose();
  }
}
