import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/profile/profile_controller.dart';
import '../../Utils/colors.dart';
import '../../Widgets/custom_appbar.dart';
import '../../Widgets/settings_subpage/custom_profile_item.dart';
import '../../core/session_controller_services/session_controller.dart';
import '../../global_mathod/showDiolouge_From/cutom_profile_edit_dialouge.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final databaseRef = FirebaseDatabase.instance.ref('users');

  final profileUpdateController = Get.put(ProfileStateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: customAppBar(tittle: 'Profile Settings', context: context),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: StreamBuilder(
            stream: databaseRef.child(SessionController().userId.toString()).onValue,
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.orange,
                  backgroundColor: Colors.green,
                ));
              } else if (snapshot.hasData) {
                Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          child: profileUpdateController.imageFile == null
                              ? map['profile_picture'].toString() != ""
                                  ? CircleAvatar(
                                      radius: 90,
                                      backgroundImage: NetworkImage(
                                        map['profile_picture'],
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
                                        child: Icon(
                                          Icons.person,
                                          size: 90,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                              : CircleAvatar(
                                  radius: 90,
                                  backgroundImage: FileImage(
                                      profileUpdateController.imageFile!)),
                        ),
                        //=====
                        Positioned(
                          bottom: 1,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: primary,
                            ),
                            child: IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      backgroundColor: background,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(25),
                                              topRight: Radius.circular(25))),
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          height: 150,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(25),
                                              topRight: Radius.circular(25),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  profileUpdateController
                                                      .cameraImage();
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          width: 2,
                                                          color: Colors.black)),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Icon(
                                                      Icons.camera_alt,
                                                      size: 35,
                                                      color: primary,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  profileUpdateController
                                                      .gallaryImage();
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          width: 2,
                                                          color: Colors.black)),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Icon(
                                                      Icons.photo,
                                                      size: 35,
                                                      color: primary,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          width: 2,
                                                          color: Colors.black)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Icon(
                                                      Icons.delete,
                                                      size: 35,
                                                      color: primary
                                                          .withOpacity(0.6),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                )),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () {
                        showNameDialogAlert(context);
                      },
                      child: customProfileItem(
                          subTittle: "${map['first name']} ${map['last name']}",
                          tittle: 'Name',
                          leadingIcon: Icons.person,
                          context: context),
                    ),
                    InkWell(
                      onTap: () {
                        showUsernameDialogAlert(context);
                      },
                      child: customProfileItem(
                          subTittle: map['username'],
                          tittle: 'username',
                          leadingIcon: Icons.person,
                          context: context),
                    ),
                    customProfileItem(
                        subTittle: map['email'],
                        tittle: 'Email address',
                        leadingIcon: Icons.alternate_email,
                        context: context),
                    InkWell(
                      onTap: () {
                        showPhoneNumberDialogAlert(context);
                      },
                      child: customProfileItem(
                          subTittle: map['phone number'].toString() == "null"
                              ? 'write your phone number'
                              : map['phone number'],
                          tittle: 'Phone number',
                          leadingIcon: Icons.call,
                          context: context),
                    ),
                    InkWell(
                      onTap: () {
                        showDescriptionDialogAlert(context);
                      },
                      child: customProfileItem(
                          tittle: 'Description',
                          subTittle: map['description'].toString() == "null"
                              ? 'write your description'
                              : map['description'],
                          leadingIcon: Icons.message,
                          context: context),
                    )
                  ],
                );
              } else {
                return const Text('somthing Error');
              }
            },
          ),
        ),
      ),
    );
  }
}
