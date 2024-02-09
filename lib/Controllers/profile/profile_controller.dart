import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/session_controller_services/session_controller.dart';
import '../../global_mathod/common/toast.dart';

class ProfileStateController extends GetxController {
  DatabaseReference databaseRef = FirebaseDatabase.instance.ref().child('users');
  FirebaseStorage storage = FirebaseStorage.instance;
  Reference storageRef = FirebaseStorage.instance.ref('/profile_picture' + SessionController().userId.toString());

  final RxBool _loading = false.obs;

  bool get loading => _loading.value;

  setLoading(bool value) => _loading.value = value;

  final ImagePicker _imagePicker = ImagePicker();
  File? imageFile;

  //pic image ========
  void cameraImage() async {
    final imagePicker =
        await _imagePicker.pickImage(source: ImageSource.camera);
    if (imagePicker != null) {
      imageFile = File(imagePicker.path);
      uploadImage();
    } else {
      showToast(message: 'Selected file does not exist.');
    }
    Get.back();
    refresh();
  }

  void gallaryImage() async {
    final imagePicker =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (imagePicker != null) {
      imageFile = File(imagePicker.path);
      uploadImage();
    } else {
      showToast(message: 'Selected file does not exist.');
    }
    Get.back();
    refresh();
  }

  //upload image to database ===========
  void uploadImage() async {
    setLoading(true);
    // upload database====================
    UploadTask uploadTask = storageRef.putFile(imageFile!);
    try {
      await Future.value(uploadTask);
      final newUrl = await storageRef.getDownloadURL();
      databaseRef.child(SessionController().userId.toString()).update({
        'profile_picture': newUrl.toString(),
      }).then((value) {
        setLoading(false);
        imageFile = null;
        showToast(message: 'Successfully profile picture updated');
      });
    } catch (error) {
      setLoading(false);
      showToast(message: 'Upload Image failed: $error');
    }
  }

  // void deleteImage()async{
  //   storageRef.delete();
  // }

  //text edit controller ===========================start==========
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void updateName() async {
    if(firstnameController.text.toString() != "" && lastnameController.text.toString() != ""){
      databaseRef.child(SessionController().userId.toString()).update({
        'first name' : firstnameController.text.toString(),
        'last name' : lastnameController.text.toString(),
      }).then((value){
        showToast(message: 'update succesfully');
        Get.back();
        firstnameController.clear();
        lastnameController.clear();
      }).onError((error, stackTrace){
        showToast(message: 'something went wrong');
      });
    }else{
      showToast(message: 'Write your full name');
    }
  }
  void updateUsername() async {
    String username = usernameController.text;
    if( username.toString() != "" && username.toString() != databaseRef.child("username").toString()){
      databaseRef.child(SessionController().userId.toString()).update({
        'username' : usernameController.text.toString(),
      }).then((value){
        Get.back();
        showToast(message: 'update succesfully');
        usernameController.clear();
      }).onError((error, stackTrace){
        showToast(message: 'something went wrong');
      });
    }else if(username.toString() == databaseRef.child("username").toString()){
      showToast(message: 'Already used this username');
    }else{
      showToast(message: 'enter valid username');
    }
  }

  void updateEmail() async {
    if(emailController.text.toString()!= ""){
      databaseRef.child(SessionController().userId.toString()).update({
        'email' : emailController.text.toString(),
      }).then((value){
        showToast(message: 'update succesfully');
        Get.back();
        emailController.clear();
      }).onError((error, stackTrace){
        showToast(message: 'something went wrong');
      });
    }else{
      showToast(message: 'Write your vaild email address');
    }
  }
  void updatePhoneNumber() async {
    if(phonenumberController.text.toString() != ""){
      databaseRef.child(SessionController().userId.toString()).update({
        'phone number' : phonenumberController.text.toString(),
      }).then((value){
        showToast(message: 'update succesfully');
        Get.back();
        phonenumberController.clear();
      }).onError((error, stackTrace){
        showToast(message: 'something went wrong');
      });
    }else{
      showToast(message: 'Write your phone number');

    }
  }
  void updateDescription() async {
    if(descriptionController.text.toString() != ""){
      databaseRef.child(SessionController().userId.toString()).update({
        'description' : descriptionController.text.toString(),
      }).then((value){
        showToast(message: 'update succesfully');
        Get.back();
        descriptionController.clear();
      }).onError((error, stackTrace){
        showToast(message: 'something went wrong');
      });
    }else{
      showToast(message: 'Write your description');
    }
  }

}
