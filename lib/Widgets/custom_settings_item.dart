import 'package:flutter/material.dart';

Widget customSettingsItem(
    {IconData ? leadingIcon, required String tittle, String ? subTittle, IconData ? trailingIcon}) {
  return ListTile(
    leading: Icon(leadingIcon, color: Colors.white,),
    title: Text(tittle, style: const TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),),
    subtitle: Text(subTittle!,
      style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 18),),
    trailing: Icon(trailingIcon, color: Colors.white.withOpacity(0.8),),
  );
}