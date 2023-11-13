
import 'package:chats_app/Controllers/tab_state_controllers.dart';
import 'package:get/get.dart';

class AllBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MyTabs());
    // Get.lazyPut(() => TabStateControllers());
  }
}