import 'package:chats_app/Controllers/auth/session_controller/session_controller.dart';
import 'package:chats_app/Model/chats_data.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageStateController extends GetxController {
  DatabaseReference messageRef = FirebaseDatabase.instance.ref().child('chats');

  TextEditingController messageController = TextEditingController();
  final isSendMessage = false.obs;

//send message ====================
//   void sendMessage(String receiverId){
//     isSendMessage.value = !isSendMessage.value;
//     if(messageController.text.isEmpty){
//       return;
//     }else{
//       final timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
//       messageRef.child(timeStamp).set({
//         'receiver' : receiverId,
//         'sender' : SessionController().userId.toString(),
//         'isSeen' : false,
//         'message' : messageController.text.toString(),
//         'type' : 'text',
//         'time' : timeStamp.toString(),
//       }).then((value){
//         messageController.clear();
//       });
//     }
//   }
  Future<void> sendMessage(String receiverId) async {
    final String currentUserId = SessionController().userId.toString();
    // final timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
    final time = DateTime.now().toString();
    if (messageController.text.isEmpty) {
      return;
    } else {
      //create a new message
      Chat newMessage = Chat(
        receiver: receiverId,
        sender: currentUserId,
        isSeen: false,
        message: messageController.text.toString(),
        type: 'text',
        time: time,
      );
      //construct chat room id from current user id and receiver id
      List<String> ids = [currentUserId, receiverId];
      // List<String> ids = (userId, otherUserId) as List<String>;
      ids.sort();
      String chatRoomId = ids.join("_");
      //add new message to database
      await messageRef
          .child(chatRoomId)
          .child("messages")
          .set(newMessage)
          .then((value) {
        messageController.clear();
      });

      //to model data==============================
      // // Create an instance of Chatsdata
      // Chatsdata chatsData = Chatsdata();
      //
      // // Create an instance of Chat and populate its fields
      // Chat newChat = Chat(
      //   isSeen: false,
      //   message: currentUserId,
      //   receiver: receiverId,
      //   sender: SessionController().userId.toString(),
      //   time: time,
      //   // replace with the actual timestamp
      //   type: "text",
      // );
      // // Add the new chat to the chats map in Chatsdata
      // chatsData.chats = {"unique_chat_key": newChat};
      // // Convert Chatsdata to JSON
      // String jsonData = chatsdataToJson(chatsData);
      // // Print or use the JSON data as needed
      // print(jsonData);
      // messageController.clear();
    }
  }

  //get massege=============================
  Stream<DatabaseEvent> getMessages(String userId, String otherUserId) {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");

    // Query the messages for the specific chat room
    Query query = messageRef
        .child(chatRoomId)
        .child("messages")
        .orderByChild("timeStamp");
    // Return a stream of events
    return query.onValue;
    // Replace this JSON string with the actual JSON data you receive
    // String jsonString =
    //     '{"chats": {"unique_chat_key": {"isSeen": true, "message": "Hello, how are you?", "receiver": "receiver_user_id", "sender": "sender_user_id", "time": "2023-11-15 12:30:00", "type": "text"}}}';
    // // Convert the JSON string to Chatsdata
    // Chatsdata receivedChatsData = chatsdataFromJson(jsonString);
    // // Access the chats map in Chatsdata
    // Map<String, Chat>? chats = receivedChatsData.chats;
    // Iterate over the chats map and access individual chat objects
    // if (chats != null) {
    //   chats.forEach((key, chat) {
    //     print("Chat Key: $key");
    //     print("Is Seen: ${chat.isSeen}");
    //     print("Message: ${chat.message}");
    //     print("Receiver: ${chat.receiver}");
    //     print("Sender: ${chat.sender}");
    //     print("Time: ${chat.time}");
    //     print("Type: ${chat.type}");
    //   });
    // }
  }

// buildMessageItem(DataSnapshot document) async{
//   Map<String, dynamic> data = document.child('chats') as Map<String, dynamic>;
//   var alignment = (data['sender'] == SessionController().userId.toString()) ? Alignment.centerRight : Alignment.centerLeft;
//   return Container(
//     alignment: alignment,
//     child: Column(
//       children: [
//         Text(data['message'], style: const TextStyle(color: Colors.white),),
//       ],
//     ),
//   );
// }
}

//get message
//   List<String> ids = (userId, otherUserId) as List<String>;
//   ids.sort();
//   String chatRoomId = ids.join("_");
//   return messageRef.child(chatRoomId).child("messages").orderByChild("timeStamp").onValue ;
