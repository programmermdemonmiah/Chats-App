import 'package:chats_app/Utils/colors.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final Widget? leading;
  final Widget? appBarTitle;
  final bool hasAppBar;
  final List<Widget>? actions;

  const CustomScaffold(
      {super.key,
      this.leading,
      this.appBarTitle,
      required this.body,
       this.hasAppBar = false,
        this.actions
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: hasAppBar ? AppBar(
        backgroundColor: appBarBg,
        leading: leading,
        title: appBarTitle,
        actions: actions,
      ) : null,
      body: SafeArea(child: body),
    );
  }
}
