
import 'package:chats_app/Utils/colors.dart';
import 'package:chats_app/Views/message_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  BuildContext context;

  SearchScreen({super.key, required this.context});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
final FirebaseFirestore firestore = FirebaseFirestore.instance;
final currentUser = FirebaseAuth.instance.currentUser!.uid.toString();
  final TextEditingController userSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 7, right: 7,bottom: 10, top: 5),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    // padding: const EdgeInsets.symmetric(horizontal: 0),
                    decoration: BoxDecoration(
                      color: appBarBg,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: TextFormField(
                      maxLines: 1,
                      controller: userSearchController,
                      onChanged: (value) {
                        // searchController.userSearch(value)
                        setState(() {});
                      },
                      style: const TextStyle(
                          color: Colors.white, fontSize: 18),
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                              size: 25,
                            )),
                        hintText: 'search user',
                        hintStyle:
                            TextStyle(color: Colors.white.withOpacity(0.5)),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                // SizedBox.shrink(),
                // Divider(
                //   thickness: 1.2,
                //   height: 0.1,
                //   color: Colors.white.withOpacity(0.4),
                // ),
                // const SizedBox(height: 8),
              ],
            ),

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: firestore.collection('users').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }else{
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final Map<String, dynamic> data = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                        final profilePicture = data['profile_picture'];
                        final name = "${data['first name']} ${data['last name']}";
                        final username = data['username'];
                        final phoneNumber = data['phone number'];
                        final description = data['description'];
                        if (data['uid'] == currentUser) {
                          return const SizedBox.shrink();
                        } else {
                          if(userSearchController.text.isEmpty){
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 6),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 1.7),
                                child: Card(
                                  elevation: 7,
                                  shadowColor: Colors.white54.withOpacity(0.3),
                                  color: appBarBg,
                                  child: ListTile(
                                    onTap: () {
                                      Get.to(MessageScreen(
                                        name: name,
                                        username: username,
                                        receiverId: data['uid'],
                                        profilePicture: profilePicture,
                                        phoneNumber: phoneNumber,
                                        description: description,
                                      ));
                                    },
                                    leading: Container(
                                      alignment: Alignment.center,
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(width: 2, color: Colors.green),
                                      ),
                                      child: profilePicture == ""
                                          ?  ClipRect(
                                        child:  Icon(
                                          Icons.person,
                                          size: 40,
                                          color: Colors.white.withOpacity(0.6),
                                        ),
                                      )
                                          : CircleAvatar(
                                        backgroundImage: NetworkImage(profilePicture),
                                        radius: 35,
                                      ),
                                    ),
                                    title: Text(name, style: const TextStyle(color: Colors.white)),
                                    subtitle: Text(username, style: TextStyle(color: Colors.white.withOpacity(0.5))),
                                  ),
                                ),
                              ),
                            );
                          }else if(name.toLowerCase().contains(userSearchController.text.toLowerCase())){
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 6),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 1.7),
                                child: Card(
                                  elevation: 7,
                                  shadowColor: Colors.white54.withOpacity(0.3),
                                  margin: const EdgeInsets.symmetric(vertical: 2),
                                  color: appBarBg,
                                  child: ListTile(
                                    onTap: () {
                                      Get.to(MessageScreen(
                                        name: name,
                                        username: username,
                                        receiverId: data['uid'],
                                        profilePicture: profilePicture,
                                        phoneNumber: phoneNumber,
                                        description: description,
                                      ));
                                    },
                                    leading: Container(
                                      alignment: Alignment.center,
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(width: 2, color: Colors.green),
                                      ),
                                      child: profilePicture == ""
                                          ? const ClipRect(
                                        child: const Icon(
                                          Icons.person,
                                          size: 50,
                                          color: Colors.white,
                                        ),
                                      )
                                          : CircleAvatar(
                                        backgroundImage: NetworkImage(profilePicture),
                                        radius: 35,
                                      ),
                                    ),
                                    title: Text(name, style: const TextStyle(color: Colors.white)),
                                    subtitle: Text(username, style: TextStyle(color: Colors.white.withOpacity(0.5))),
                                  ),
                                ),
                              ),
                            );

                          }else{
                            return const SizedBox.shrink();
                          }
                        }
                      },
                    );
                  }
                },
              ),

            ),
          ],
        ),
      ),
    );
  }
}


