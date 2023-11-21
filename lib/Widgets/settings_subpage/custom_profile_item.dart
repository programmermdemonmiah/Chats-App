import 'package:flutter/material.dart';

Widget customProfileItem(
    {required String tittle,
    IconData? leadingIcon,
    String? subTittle,
    required BuildContext context}) {
  return Column(
    children: [
      ListTile(
        leading: Icon(
          leadingIcon,
          color: Colors.white,
        ),
        title: Text(
          tittle,
          style: const TextStyle(color: Colors.white, fontSize: 17),
        ),
        subtitle: Text(
          subTittle!,
          style: TextStyle(color: Colors.white.withOpacity(0.7)),
        ),
        trailing: const Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
      Divider(
        thickness: 1.2,
        indent: 20,
        endIndent: 20,
        color: Colors.white.withOpacity(0.2),
      ),
    ],
  );
}
