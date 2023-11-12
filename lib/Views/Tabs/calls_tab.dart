import 'package:chats_app/Utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CallsTab extends StatelessWidget {
  const CallsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
      return ListTile(
        title: const Text('Friend Name', style: TextStyle(color: Colors.white),),
        subtitle: Text('',style: TextStyle(color: Colors.white.withOpacity(0.5)),),
        leading: const CircleAvatar(
          backgroundImage: NetworkImage(''),
          backgroundColor: primary,
          radius: 60,
        ),
        trailing: IconButton(onPressed: () {
          
        }, icon: const Icon(Icons.call, color: primary,)),
      );
    },
    );
  }
}
