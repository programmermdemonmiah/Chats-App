
import 'package:chats_app/Controllers/auth/log_reg_state_controller.dart';
import 'package:chats_app/Controllers/auth/num_login_controller.dart';
import 'package:chats_app/Controllers/auth/passwrod_state_controller.dart';
import 'package:chats_app/Controllers/profile/profile_controller.dart';
import 'package:chats_app/Controllers/message_controller.dart';
import 'package:chats_app/Controllers/password_secure_state_controllers.dart';
import 'package:chats_app/Controllers/tab_state_controllers.dart';
import 'package:get/get.dart';

class AllBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MyTabs());
    Get.lazyPut(() => PasswordSecureState());
    Get.lazyPut(() => LogRegStateController());
    Get.lazyPut(() => ProfileStateController());
    // Get.lazyPut(() => SearchStateController());
    Get.lazyPut(() => MessageStateController());
    Get.lazyPut(() => PasswordStateController());
    Get.lazyPut(() => NumberLoginController());
  }
}