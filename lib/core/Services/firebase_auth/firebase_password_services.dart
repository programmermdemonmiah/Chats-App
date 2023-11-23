import 'package:chats_app/Views/auth/forgot_password/forgotGiveLinkScreen.dart';
import 'package:chats_app/global_mathod/common/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';


class PasswordServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> forgotPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      showToast(message: 'Password reset email sent successfully.');
      // return _auth.currentUser;  // Return the current user
      Get.until((route) => false);
     Get.to(const ForgotGiveLinkScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showToast(message: 'No user found with this email address.');
      } else if (e.code == 'invalid-email') {
        showToast(message: 'Invalid email address.');
      } else if(e.code == 'missing-email'){
        showToast(message: "This Email user not found");
      }else{
        showToast(message: "${e}");
      }
    } catch (e) {
      showToast(message: 'An unexpected error occurred.');
    }

    return null; // Return null if an error occurs
  }

  //password change sevices =========================================
  Future<User?> changePassword(String oldPassword, String newPassword)async{
     try{
       var credential = await EmailAuthProvider.credential(
           email: _auth.currentUser!.email.toString(), password: oldPassword) ;
      await _auth.currentUser!.reauthenticateWithCredential(credential).then((value){
        _auth.currentUser!.updatePassword(newPassword).then((value) {
          Get.back();
          showToast(message: 'successfully you changed your password');
        },);
      }).catchError((error){
        showToast(message: "$error");
      });
     }on FirebaseAuthException catch (e){
       if( e.code == 'wrong-password'){
         showToast(message: 'You are enter wrong password.');
       }else{
         showToast(message: 'An error occured: ${e.code}');
       }
     }
     return null;
  }


}
