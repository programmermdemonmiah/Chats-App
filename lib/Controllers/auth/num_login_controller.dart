import 'package:chats_app/global_mathod/common/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NumberLoginController extends GetxController {
  TextEditingController inputNumberController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();

  void sendCode() async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber:
        '${countryCodeController.text.toString()}${inputNumberController.text.toString()}',
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          // Handle verification failure (e.g., show an error message to the user)
          print('Verification failed: ${e.message}');
          showToast(message: 'Verification failed: ${e.message}');
        },
        codeSent: (String verificationId, int? resendToken) {
          // Handle code sent (e.g., navigate to the code verification screen)
          print('Code sent successfully: $verificationId');
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Handle code auto-retrieval timeout
          print('Code auto-retrieval timeout: $verificationId');
        },
      );
    } catch (e) {
      // Handle other exceptions
      print('Error sending code: $e');
      showToast(message: "$e");
    }
  }
}
