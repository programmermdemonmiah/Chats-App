import 'package:chats_app/Utils/colors.dart';
import 'package:flutter/material.dart';

class ChatsTab extends StatelessWidget {
  const ChatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: const Text('Friend Name', style: TextStyle(color: Colors.white),),
            subtitle: Text('username', style: TextStyle(color: Colors.white.withOpacity(0.5)),),
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(''),
              radius: 60,
              backgroundColor: primary,
            ),
            trailing: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 20,
                  width: 20,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: primary
                  ),
                  child: const Text('1'),
                ),
                Container(
                  child: const Text('9.15',style: TextStyle(color: primary),),
                )
              ],
            ),
          );
        },
    );
  }
}
