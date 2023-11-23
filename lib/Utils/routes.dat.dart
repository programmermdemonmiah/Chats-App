import 'package:chats_app/Utils/route_name.dart';
import 'package:chats_app/Views/auth/forgot_password/forgotGiveLinkScreen.dart';
import 'package:chats_app/Views/auth/forgot_password/forgot_password_screen.dart';
import 'package:chats_app/Views/auth/log_reg_screen.dart';
import 'package:chats_app/Views/auth/login/login_screen.dart';
import 'package:chats_app/Views/friend_profile_screen.dart';
import 'package:chats_app/Views/home_Screen.dart';
import 'package:chats_app/Views/message_screen.dart';
import 'package:chats_app/Views/search_screen.dart';
import 'package:chats_app/Views/settigns/profile_screen.dart';
import 'package:chats_app/Views/settings_screen.dart';
import 'package:chats_app/Views/spalash/spalash_screen.dart';
import 'package:chats_app/Views/view_picture/view_picture_Screen.dart';
import 'package:get/get.dart';

import '../Views/auth/register/registration_screen.dart';

class Routes{
  static var routes = [
    GetPage(name: RouteNames.homeScreen, page: () => HomeScreen(),),
    GetPage(name: RouteNames.spalashScreen, page: () => const SpalashScreen(),),
    //============
    GetPage(name: RouteNames.logRegScreen, page: () => const LogRegScreen(),),
    GetPage(name: RouteNames.loginScreen, page: () => LoginScreen(),),
    GetPage(name: RouteNames.registerScreen, page: () => RegistrationScreen(),),
    GetPage(name: RouteNames.forgotScreen, page: () => ForgotPasswordScreen(),),
    GetPage(name: RouteNames.forgotGiveLinkScreen, page: () => const ForgotGiveLinkScreen(),),

    //========================
    // GetPage(name: RouteNames.searchScreen, page: () => const SearchScreen(),),
   // GetPage(name: RouteNames.messageScreen, page: () => MessageScreen(name: name, username: username, receiverId: receiverId, profilePicture: profilePicture, description: description, phoneNumber: phoneNumber),),
    //======
    // GetPage(name: RouteNames.viewPictureScreen, page: () => ViewPictureScreen(profilePicture: profilePicture),),
    //======
    //GetPage(name: RouteNames.friendProfileScreen, page: () => FriendPfofileScreen(name: name, username: username, profilePicture: profilePicture, phoneNumber: phoneNumber, description: description),),
    //===============Settings and settings sub page====================
    GetPage(name: RouteNames.settingsScreen, page: () => SettingsScreen(),),
    //====
    GetPage(name: RouteNames.profileScreen, page: () => ProfileScreen(),),


  ];
}