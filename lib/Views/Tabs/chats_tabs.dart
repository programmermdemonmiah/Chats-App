import 'package:chats_app/Controllers/message_controller.dart';
import 'package:chats_app/Utils/colors.dart';
import 'package:chats_app/Views/message_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatsTab extends StatelessWidget {
  ChatsTab({super.key});

  final  _messageController = Get.put(MessageStateController());
  final fireStore = FirebaseFirestore.instance.collection('users');
  final currentUser = FirebaseAuth.instance.currentUser!.uid.toString();
  final DateFormat _dateFormat = DateFormat('hh:mm a');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: fireStore.orderBy('timeStamp', descending: true).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.hasError) {
              return const Text('something Error re open app');
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              return ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final Map<String, dynamic> data =
                  snapshot.data!.docs[index].data() as Map<String, dynamic>;
                  final name =
                      "${data['first name'].toString()} ${data['last name']
                      .toString()}";
                  final username = data['username'].toString();
                  final receiverId = data['uid'].toString();
                  final profilePicture = data['profile_picture'].toString();
                  final phoneNumber = data['phone number'].toString();
                  final description = data['description'].toString();
                  final timeStamp = data['timeStamp'] as Timestamp?;
                  final lastMessage = data['lastMessage'].toString();
                  String ? lastMessageTime;
                  if(timeStamp != null){
                    final DateTime _convertDateTime = timeStamp.toDate();
                    lastMessageTime =  _dateFormat.format(_convertDateTime);
                  }else{
                    return null;
                  }
                  List<String> ids = [currentUser, data['uid'].toString()];
                  ids.sort();
                  String chatRoomId = ids.join("_");
                  if (data['chatRoomId'].toString() == chatRoomId) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 3.5),
                      child: Card(
                        color: appBarBg,
                        shadowColor: Colors.white54.withOpacity(0.3),
                        elevation: 7,
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                          onTap: () {
                            _messageController.seenUpdate(receiverId);
                            Get.to(MessageScreen(
                              name: name,
                              username: username,
                              receiverId: receiverId,
                              profilePicture: profilePicture,
                              phoneNumber: phoneNumber,
                              description: description,
                            ));
                          },
                          title: Text(
                            name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: Colors.white),
                          ),
                          subtitle: lastMessage  != "null"? Text(
                            lastMessage,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                            TextStyle(color: Colors.white.withOpacity(0.5)),
                          ) : const SizedBox.shrink(),
                          leading: data['profile_picture'].toString() == ""
                              ? Container(
                            alignment: Alignment.center,
                            height: 75,
                            width: 75,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 2, color: Colors.green),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: ClipRect(
                                child: Icon(
                                  Icons.person,
                                  size: 40,
                                  color: Colors.white.withOpacity(0.7),
                                ),
                              ),
                            ),
                          )
                              : CircleAvatar(
                            backgroundImage: NetworkImage(
                                data['profile_picture'].toString()),
                            radius: 40,
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.only(right: 7.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 20,
                                  width: 20,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle, color: primary),
                                  child: Text(''),
                                ),

                                // Text(_messageController.lastMessageDetails.elementAt(index), style: const TextStyle(color: primary),),
                                lastMessageTime != "null"
                                    ? Text(
                                  lastMessageTime.toString(),
                                  style: const TextStyle(color: primary),) : SizedBox.shrink()
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              );
            }
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
