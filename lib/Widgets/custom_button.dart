import 'package:chats_app/Utils/colors.dart';
import 'package:flutter/material.dart';

Widget customButton({required String buttonName, required Color buttonColor, required BuildContext context}){
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      height: 40,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: primary, width: 2),
        color: buttonColor,
      ),
      child: Text(buttonName, style: const TextStyle(color: Colors.white, fontSize: 18),),
    ),
  );
}