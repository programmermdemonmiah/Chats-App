import 'dart:io';
import 'package:chats_app/global_mathod/common/toast.dart';
import 'package:chats_app/core/session_controller_services/session_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileStateController extends GetxController {
  // DatabaseReference databaseRef = FirebaseDatabase.instance.ref().child('users');
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  FirebaseStorage storage = FirebaseStorage.instance;
  Reference storageRef = FirebaseStorage.instance.ref('/profile_picture' + SessionController().userId.toString());

  final RxBool _loading = false.obs;

  bool get loading => _loading.value;

  setLoading(bool value) => _loading.value = value;
  final ImagePicker _imagePicker = ImagePicker();
   RxString imageFile = ''.obs;
   File ? _imageFile;


  //pic image ========
  void cameraImage() async {
    final imagePicker =
        await _imagePicker.pickImage(source: ImageSource.camera);
    if (imagePicker != null) {
      imageFile.value = imagePicker.path.toString();
      _imageFile = File(imagePicker.path);
      uploadImage();
    } else {
      showToast(message: 'Selected file does not exist.');
    }
    Get.back();
    refresh();
  }

  void gallaryImage() async {
    final imagePicker = await _imagePicker.pickImage(source: ImageSource.gallery);
    if(imagePicker != null) {
      imageFile.value = imagePicker.path.toString();
      _imageFile = File(imagePicker.path);
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
    UploadTask uploadTask = storageRef.putFile(_imageFile!);
    final fireStoreDataUpdate = _firestore.collection('users').doc(SessionController().userId.toString());
    try {
      await Future.value(uploadTask);
      final newUrl = await storageRef.getDownloadURL();
      fireStoreDataUpdate.update({
        'profile_picture': newUrl.toString(),
      }).then((value) {
        imageFile.value = '';
        setLoading(false);
        showToast(message: 'Successfully profile picture updated');
      });
    } catch (error) {
      setLoading(false);
      showToast(message: 'Upload Image failed: $error');
    }
  }

  void deleteImage()async{
    storageRef.delete();
    final fireStoreDataUpdate = _firestore.collection('users').doc(SessionController().userId.toString());
    fireStoreDataUpdate.update({
      "profile_picture" : "",
    }).then((value){
      showToast(message: 'Delete succesfully');
      Get.back();
    }).onError((error, stackTrace){
      showToast(message: 'something went wrong');
    });
  }

  //text edit controller ===========================start==========
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void updateName() async {
    final fireStoreDataUpdate = _firestore.collection('users').doc(SessionController().userId.toString());
    if(firstnameController.text.toString() != "" && lastnameController.text.toString() != ""){
  fireStoreDataUpdate.update({
        'first name' : firstnameController.text.toString(),
        'last name' : lastnameController.text.toString(),
      }).then((value){
        Get.back();
        showToast(message: 'update succesfully');
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
    final fireStoreDataUpdate = _firestore.collection('users').doc(SessionController().userId.toString());
    if( username.toString() != "" && username.toString() != _firestore.collection('users').doc(SessionController().userId.toString()).collection('username').toString()){
      fireStoreDataUpdate.update({
        'username' : usernameController.text.toString(),
      }).then((value){
        Get.back();
        showToast(message: 'update succesfully');
        usernameController.clear();
      }).onError((error, stackTrace){
        showToast(message: 'something went wrong');
      });
    }else if(username.toString() == _firestore.collection('users').doc(SessionController().userId.toString()).collection('username').toString()){
      showToast(message: 'Already used this username');
    }else{
      showToast(message: 'enter valid username');
    }
  }

  void updateEmail() async {
    final fireStoreDataUpdate = _firestore.collection('users').doc(SessionController().userId.toString());
    if(emailController.text.toString()!= ""){
     fireStoreDataUpdate.update({
        'email' : emailController.text.toString(),
      }).then((value){
       Get.back();
        showToast(message: 'update succesfully');
        emailController.clear();
      }).onError((error, stackTrace){
        showToast(message: 'something went wrong');
      });
    }else{
      showToast(message: 'Write your vaild email address');
    }
  }
  void updatePhoneNumber() async {
    final fireStoreDataUpdate = _firestore.collection('users').doc(SessionController().userId.toString());
    if(phonenumberController.text.toString() != ""){
      fireStoreDataUpdate.update({
        'phone number' : phonenumberController.text.toString(),
      }).then((value){
        Get.back();
        showToast(message: 'update succesfully');
        phonenumberController.clear();
      }).onError((error, stackTrace){
        showToast(message: 'something went wrong');
      });
    }else{
      showToast(message: 'Write your phone number');

    }
  }
  void updateDescription() async {
    final fireStoreDataUpdate = _firestore.collection('users').doc(SessionController().userId.toString());
    if(descriptionController.text.toString() != ""){
     fireStoreDataUpdate.update({
        'description' : descriptionController.text.toString(),
      }).then((value){
       Get.back();
        showToast(message: 'update succesfully');
        descriptionController.clear();
      }).onError((error, stackTrace){
        showToast(message: 'something went wrong');
      });
    }else{
      showToast(message: 'Write your description');
    }
  }

}
