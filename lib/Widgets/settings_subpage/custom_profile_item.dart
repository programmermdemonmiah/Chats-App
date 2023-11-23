import 'package:chats_app/Utils/colors.dart';
import 'package:flutter/material.dart';

Widget customProfileItem(
    {required String tittle,
    IconData? leadingIcon,
    String? subTittle,
      IconData ? trailingIcon,
    required BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2),
    child: Card(
      color: appBarBg,shadowColor: Colors.white54.withOpacity(0.3), elevation: 7,
      child: ListTile(
        // contentPadding: EdgeInsets.symmetric(horizontal: 6),
        leading: Icon(
          leadingIcon,
          color: Colors.white.withOpacity(0.5),
        ),
        title: Text(
          tittle,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          subTittle!,
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              ),
        ),
        trailing: Icon(
          trailingIcon,
          color: Colors.white.withOpacity(0.5),
        ),
      ),
    ),
  );
}
