import 'package:get/get.dart';

class PasswordSecureState extends GetxController{
  var isSecure = true.obs;

  void showPassword(){
    isSecure.value = !isSecure.value;
    print('changed');
  }
}