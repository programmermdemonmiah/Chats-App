import 'package:chats_app/All_Binding/all_binding.dart';
import 'package:chats_app/Views/spalash/spalash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  AllBinding().dependencies();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        
      ),
      debugShowCheckedModeBanner: false,
      home: const SpalashScreen(),
    );
  }
}
