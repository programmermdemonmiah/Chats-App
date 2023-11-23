
import 'package:audioplayers/audioplayers.dart';
import 'package:chats_app/Controllers/message_controller.dart';
import 'package:chats_app/Utils/colors.dart';
import 'package:chats_app/Views/friend_profile_screen.dart';
import 'package:chats_app/Views/home_Screen.dart';
import 'package:chats_app/Widgets/custom_scafold.dart';
import 'package:chats_app/core/session_controller_services/session_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MessageScreen extends GetWidget<MessageStateController> {
  String name;
  String username;
  String receiverId;
  String? profilePicture;
  String? description;
  String? phoneNumber;

  MessageScreen(
      {super.key,
      required this.name,
      required this.username,
      required this.receiverId,
      required this.profilePicture,
      required this.description,
      required this.phoneNumber});


  DocumentReference<Map<String, dynamic>> messageRef =
      FirebaseFirestore.instance.collection('chats').doc();
  final currentUserId = SessionController().userId.toString();
  final DateFormat _dateFormat = DateFormat('hh:mm a');
  final scroollController = ScrollController();

  final audioPlayer = AudioPlayer();
  final playAudio = AudioCache();

  // final messageFocus = FocusNode();
  // final messageSendButtonFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return CustomScaffold(
      hasAppBar: true,
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
                    size: 25,
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
                      border: Border.all(
                          width: 2, color: primary.withOpacity(0.8)),
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
                      backgroundImage: NetworkImage(profilePicture!),
                      radius: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        appBarTitle: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 1),
          onTap: () {
            Get.to(FriendPfofileScreen(
                name: name,
                username: username,
                profilePicture: profilePicture,
                phoneNumber: phoneNumber,
                description: description));
          },
          title: Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 17.5),
          ),
          subtitle: Text(
            username,
            style:
            TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 16),
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
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
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
        body: Container(
      height: size.height,
      width: size.width,
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              controller: scroollController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  StreamBuilder(
                    stream: controller.getMessage(currentUserId, receiverId),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const SizedBox.shrink();
                        } else if (snapshot.hasError) {
                          return const SizedBox.shrink();
                        } else {
                          return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            shrinkWrap: true,
                            primary: false,
                            // controller: scroollController,
                            addAutomaticKeepAlives: true,
                            itemBuilder: (context, index) {
                              Map<String, dynamic> data = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                              // String messageTime = dateFormat.;
                              final timeStamp = data['timeStamp'] as Timestamp?;
                              String? lastMessageTime;
                              if (timeStamp != null) {
                                final DateTime _convertDateTime = timeStamp.toDate();
                                lastMessageTime = _dateFormat.format(_convertDateTime);
                              } else {
                                return null;
                              }

                              final _mainAxisAlignment =
                              (data['sender'] == currentUserId) ? MainAxisAlignment.end : MainAxisAlignment.start;
                              final _crossAxisAlignment = (data['sender'] == currentUserId) ? CrossAxisAlignment.end : CrossAxisAlignment.start;
                              final alignmentContainer =
                              (data['sender'] == currentUserId) ? Alignment.centerRight : Alignment.centerLeft;
                              final mBackColor =
                              (data['sender'] == currentUserId) ? primary : appBarBg;
                              return Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 1),
                                child: SizedBox(
                                  width: MediaQuery.sizeOf(context).width/1.3,
                                  child: Row(
                                    mainAxisAlignment: _mainAxisAlignment,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        width: size.width/1.4,
                                        child: Container(
                                          alignment: alignmentContainer,
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: mBackColor,
                                              borderRadius:
                                              BorderRadius.circular(10),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    data['message']
                                                        .toString(),
                                                    maxLines: 10,
                                                    textAlign: TextAlign.start,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16.5,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  lastMessageTime.toString(),
                                                  style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.5),
                                                    fontSize: 11.5,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      (data['sender'] == currentUserId)
                                          ? Container(
                                        width: 18,
                                        height: 18,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 1.5,
                                              color: Colors.green,
                                          ),
                                          color: Colors.green,
                                        ),
                                        child: Center(
                                          child: (data["isSeen"] ==
                                              null ||
                                              data["isSeen"] ==
                                                  false)
                                              ? const Icon(
                                            Icons.done,
                                            color:
                                            Colors.white,
                                            size: 15,
                                          )
                                              : CircleAvatar(
                                              backgroundImage:
                                              NetworkImage(
                                                  profilePicture
                                                      .toString())),
                                        ),
                                      )
                                          : const SizedBox.shrink(),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // (data['chatRoomId'].toString() == ) || _messageController.message != "" || _messageController.message != null || _messageController.message != "null"
                  //     ? Padding(
                  //   padding:
                  //   const EdgeInsets.symmetric(vertical: 1),
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 20),
                  //     alignment: Alignment.centerRight,
                  //     child: SizedBox(
                  //         width:
                  //         MediaQuery.sizeOf(context).width /
                  //             1.4,
                  //         child: Container(
                  //           alignment: Alignment.centerRight,
                  //           child: Container(
                  //             // alignment: Alignment.centerLeft,
                  //             padding: const EdgeInsets.all(10),
                  //             decoration: BoxDecoration(
                  //                 color: primary,
                  //                 borderRadius:
                  //                 BorderRadius.circular(10)),
                  //             child: Text(
                  //               _messageController.message,
                  //               style: const TextStyle(
                  //                   color: Colors.white,
                  //                   fontSize: 16.5,
                  //                   overflow:
                  //                   TextOverflow.ellipsis),
                  //             ),
                  //           ),
                  //         )),
                  //   ),
                  // )
                  //     : SizedBox.shrink(),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  decoration: BoxDecoration(
                      color: appBarBg,
                      borderRadius: BorderRadius.circular(25)),
                  child: TextFormField(
                    controller: controller.messageController,
                    minLines: 1,
                    maxLines: 5,
                    focusNode: controller.messageFocus,
                    // onFieldSubmitted: (value) {
                    //   FocusNodes.fieldFocus(
                    //       context,
                    //       _messageController.messageFocus,
                    //       _messageController.messageSendButtonFocus);
                    // },
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
              const SizedBox(
                width: 3,
              ),
              CircleAvatar(
                backgroundColor: primary,
                child: IconButton(
                  focusNode: controller.messageSendButtonFocus,
                  onPressed: () {
                    if (controller.messageController.text.isNotEmpty) {
                      controller.sendMessage(receiverId)
                          .then((value) {
                        scroollController.animateTo(
                            scroollController.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 1),
                            curve: Curves.easeIn).then((value){
                          audioPlayer.play(AssetSource('assets/audio/m4a')).then((value){
                            print('audio success');
                          });
                        });
                      });
                    } else {
                      return;
                    }
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
        ],
      ),
    ),
    );

    // return SafeArea(
    //   child: Scaffold(
    //     backgroundColor: background,
    //     appBar: AppBar(
    //       backgroundColor: appBarBg,
    //       automaticallyImplyLeading: false,
    //       leading: Container(
    //         decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
    //         child: InkWell(
    //           onTap: () {
    //             Get.to(HomeScreen());
    //           },
    //           child: Stack(
    //             alignment: Alignment.center,
    //             children: [
    //               const Positioned(
    //                 left: 1,
    //                 child: Icon(
    //                   Icons.arrow_back_ios,
    //                   color: Colors.white,
    //                   size: 25,
    //                 ),
    //               ),
    //               Positioned(
    //                 right: 0,
    //                 child: Container(
    //                   alignment: Alignment.center,
    //                   height: 40,
    //                   width: 40,
    //                   decoration: BoxDecoration(
    //                     shape: BoxShape.circle,
    //                     border: Border.all(
    //                         width: 2, color: primary.withOpacity(0.8)),
    //                   ),
    //                   child: profilePicture == ""
    //                       ? const ClipRect(
    //                           child: Icon(
    //                             Icons.person,
    //                             size: 35,
    //                             color: Colors.white,
    //                           ),
    //                         )
    //                       : CircleAvatar(
    //                           backgroundImage: NetworkImage(profilePicture!),
    //                           radius: 30,
    //                         ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //       title: ListTile(
    //         contentPadding: const EdgeInsets.symmetric(horizontal: 1),
    //         onTap: () {
    //           Get.to(FriendPfofileScreen(
    //               name: name,
    //               username: username,
    //               profilePicture: profilePicture,
    //               phoneNumber: phoneNumber,
    //               description: description));
    //         },
    //         title: Text(
    //           name,
    //           maxLines: 1,
    //           overflow: TextOverflow.ellipsis,
    //           style: const TextStyle(
    //               color: Colors.white,
    //               fontWeight: FontWeight.w500,
    //               fontSize: 17.5),
    //         ),
    //         subtitle: Text(
    //           username,
    //           style:
    //               TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 16),
    //         ),
    //       ),
    //       actions: [
    //         IconButton(
    //             onPressed: () {},
    //             icon: const Icon(
    //               Icons.call,
    //               color: Colors.white,
    //               size: 25,
    //             )),
    //         IconButton(
    //             onPressed: () {},
    //             icon: const Icon(
    //               Icons.video_call,
    //               color: Colors.white,
    //               size: 25,
    //             )),
    //         PopupMenuButton(
    //           color: appBarBg.withOpacity(0.6),
    //           shadowColor: appBarBg,
    //           offset: const Offset(0, 48),
    //           shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(10)),
    //           icon: const Icon(
    //             Icons.more_vert,
    //             color: Colors.white,
    //           ),
    //           itemBuilder: (context) => const [
    //             PopupMenuItem(
    //               value: 1,
    //               child: Icon(
    //                 Icons.search,
    //                 color: Colors.white,
    //                 size: 20,
    //               ),
    //             )
    //           ],
    //           onSelected: (value) {
    //             if (value == 1) {
    //               // Get.to();
    //             } else {
    //               Get.back();
    //             }
    //           },
    //         ),
    //       ],
    //     ),
    //     body: Container(
    //       height: size.height,
    //       width: size.width,
    //       padding: const EdgeInsets.all(15),
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.end,
    //         children: [
    //           Expanded(
    //             child: SingleChildScrollView(
    //               physics: const BouncingScrollPhysics(),
    //               controller: scroollController,
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.start,
    //                 children: [
    //                   StreamBuilder(
    //                     stream: _messageController.getMessage(
    //                         currentUserId, receiverId),
    //                     builder: (context, snapshot) {
    //                       if (snapshot.hasData) {
    //                         if (snapshot.connectionState ==
    //                             ConnectionState.waiting) {
    //                           return const SizedBox.shrink();
    //                         } else if (snapshot.hasError) {
    //                           return const SizedBox.shrink();
    //                         } else {
    //                           return ListView.builder(
    //                             itemCount: snapshot.data!.docs.length,
    //                             shrinkWrap: true,
    //                             primary: false,
    //                             // controller: scroollController,
    //                             addAutomaticKeepAlives: true,
    //                             itemBuilder: (context, index) {
    //                               Map<String, dynamic> data =
    //                                   snapshot.data!.docs[index].data()
    //                                       as Map<String, dynamic>;
    //                               // String messageTime = dateFormat.;
    //                               final timeStamp =
    //                                   data['timeStamp'] as Timestamp?;
    //                               String? lastMessageTime;
    //                               if (timeStamp != null) {
    //                                 final DateTime _convertDateTime =
    //                                     timeStamp.toDate();
    //                                 lastMessageTime =
    //                                     _dateFormat.format(_convertDateTime);
    //                               } else {
    //                                 return null;
    //                               }
    //
    //                               final _mainAxisAlignment =
    //                                   (data['sender'] == currentUserId)
    //                                       ? MainAxisAlignment.end
    //                                       : MainAxisAlignment.start;
    //                               final _crossAxisAlignment =
    //                                   (data['sender'] == currentUserId)
    //                                       ? CrossAxisAlignment.end
    //                                       : CrossAxisAlignment.start;
    //                               final alignmentContainer =
    //                                   (data['sender'] == currentUserId)
    //                                       ? Alignment.centerRight
    //                                       : Alignment.centerLeft;
    //                               final mBackColor =
    //                                   (data['sender'] == currentUserId)
    //                                       ? primary
    //                                       : appBarBg;
    //                               return Padding(
    //                                 padding:
    //                                     const EdgeInsets.symmetric(vertical: 1),
    //                                 child: SizedBox(
    //                                   width: size.width/1.2,
    //                                   child: Row(
    //                                     mainAxisAlignment: _mainAxisAlignment,
    //                                     crossAxisAlignment:
    //                                         CrossAxisAlignment.end,
    //                                     children: [
    //                                       SizedBox(
    //                                         // width: MediaQuery.of(context).size.width/1.4,
    //                                         child: Container(
    //                                           padding: const EdgeInsets.all(10),
    //                                           decoration: BoxDecoration(
    //                                             color: mBackColor,
    //                                             borderRadius:
    //                                                 BorderRadius.circular(10),
    //                                           ),
    //                                           child: Row(
    //                                             mainAxisAlignment: MainAxisAlignment.start,
    //                                             crossAxisAlignment: CrossAxisAlignment.end,
    //                                             children: [
    //                                               Text(
    //                                                 data['message']
    //                                                     .toString(),
    //                                                 maxLines: 10,
    //
    //                                                 overflow: TextOverflow.ellipsis,
    //                                                 style: const TextStyle(
    //                                                   color: Colors.white,
    //                                                   fontSize: 16.5,
    //                                                   textBaseline: TextBaseline.ideographic
    //                                                 ),
    //                                               ),
    //                                               const SizedBox(width: 12),
    //                                               Text(
    //                                                 lastMessageTime.toString(),
    //                                                 style: TextStyle(
    //                                                   color: Colors.white
    //                                                       .withOpacity(0.5),
    //                                                   fontSize: 12,
    //                                                 ),
    //                                               )
    //                                             ],
    //                                           ),
    //                                         ),
    //                                       ),
    //                                       const SizedBox(
    //                                         width: 2,
    //                                       ),
    //                                       (data['sender'] == currentUserId)
    //                                           ? Container(
    //                                               width: 18,
    //                                               height: 18,
    //                                               decoration: BoxDecoration(
    //                                                 shape: BoxShape.circle,
    //                                                 border: Border.all(
    //                                                     width: 1.5,
    //                                                     color: Colors.green),
    //                                                 color: Colors
    //                                                     .green, // Set your desired color
    //                                               ),
    //                                               child: Center(
    //                                                 child: (data["isSeen"] ==
    //                                                             null ||
    //                                                         data["isSeen"] ==
    //                                                             false)
    //                                                     ? const Icon(
    //                                                         Icons.done,
    //                                                         color:
    //                                                             Colors.white,
    //                                                         // Set your desired color
    //                                                         size: 15,
    //                                                       )
    //                                                     : CircleAvatar(
    //                                                         backgroundImage:
    //                                                             NetworkImage(
    //                                                                 profilePicture
    //                                                                     .toString())),
    //                                               ),
    //                                             )
    //                                           : const SizedBox.shrink(),
    //                                     ],
    //                                   ),
    //                                 ),
    //                               );
    //                             },
    //                           );
    //                         }
    //                       } else {
    //                         return const SizedBox.shrink();
    //                       }
    //                     },
    //                   ),
    //                   const SizedBox(
    //                     height: 20,
    //                   ),
    //                   // (data['chatRoomId'].toString() == ) || _messageController.message != "" || _messageController.message != null || _messageController.message != "null"
    //                   //     ? Padding(
    //                   //   padding:
    //                   //   const EdgeInsets.symmetric(vertical: 1),
    //                   //   child: Container(
    //                   //     padding: const EdgeInsets.symmetric(
    //                   //         horizontal: 20),
    //                   //     alignment: Alignment.centerRight,
    //                   //     child: SizedBox(
    //                   //         width:
    //                   //         MediaQuery.sizeOf(context).width /
    //                   //             1.4,
    //                   //         child: Container(
    //                   //           alignment: Alignment.centerRight,
    //                   //           child: Container(
    //                   //             // alignment: Alignment.centerLeft,
    //                   //             padding: const EdgeInsets.all(10),
    //                   //             decoration: BoxDecoration(
    //                   //                 color: primary,
    //                   //                 borderRadius:
    //                   //                 BorderRadius.circular(10)),
    //                   //             child: Text(
    //                   //               _messageController.message,
    //                   //               style: const TextStyle(
    //                   //                   color: Colors.white,
    //                   //                   fontSize: 16.5,
    //                   //                   overflow:
    //                   //                   TextOverflow.ellipsis),
    //                   //             ),
    //                   //           ),
    //                   //         )),
    //                   //   ),
    //                   // )
    //                   //     : SizedBox.shrink(),
    //                 ],
    //               ),
    //             ),
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               Expanded(
    //                 child: Container(
    //                   width: double.infinity,
    //                   padding: const EdgeInsets.symmetric(horizontal: 18),
    //                   decoration: BoxDecoration(
    //                       color: appBarBg,
    //                       borderRadius: BorderRadius.circular(25)),
    //                   child: TextFormField(
    //                     controller: _messageController.messageController,
    //                     minLines: 1,
    //                     maxLines: 5,
    //                     focusNode: _messageController.messageFocus,
    //                     // onFieldSubmitted: (value) {
    //                     //   FocusNodes.fieldFocus(
    //                     //       context,
    //                     //       _messageController.messageFocus,
    //                     //       _messageController.messageSendButtonFocus);
    //                     // },
    //                     style: const TextStyle(color: Colors.white),
    //                     decoration: InputDecoration(
    //                       hintText: 'typing your message',
    //                       hintStyle:
    //                           TextStyle(color: Colors.white.withOpacity(0.4)),
    //                       enabledBorder: InputBorder.none,
    //                       focusedBorder: InputBorder.none,
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               const SizedBox(
    //                 width: 3,
    //               ),
    //               CircleAvatar(
    //                 backgroundColor: primary,
    //                 child: IconButton(
    //                   focusNode: _messageController.messageSendButtonFocus,
    //                   onPressed: () {
    //                     if (_messageController
    //                         .messageController.text.isNotEmpty) {
    //                       _messageController
    //                           .sendMessage(receiverId)
    //                           .then((value) {
    //                         scroollController.animateTo(
    //                             scroollController.position.maxScrollExtent,
    //                             duration: const Duration(milliseconds: 1),
    //                             curve: Curves.easeIn);
    //                       });
    //                     } else {
    //                       return;
    //                     }
    //                   },
    //                   icon: const ClipRect(
    //                     child: Icon(
    //                       Icons.send,
    //                       color: Colors.white,
    //                       size: 25,
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
