import 'package:chats_app/All_Binding/all_binding.dart';
import 'package:chats_app/Utils/routes.dat.dart';
import 'package:chats_app/Views/auth/number_login/number_login.dart';
import 'package:chats_app/Views/spalash/spalash_screen.dart';
import 'package:chats_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  AllBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // getPages: Routes.routes,
      // initialRoute: "/spalashScreen",
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,

      home: const SpalashScreen(),
    );
  }
}
