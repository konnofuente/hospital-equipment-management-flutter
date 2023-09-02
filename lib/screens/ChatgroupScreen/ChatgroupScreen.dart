import 'package:gestion_hopital/screens/ChatgroupScreen/Components/GroupList/group_list.dart';
import 'package:gestion_hopital/screens/ChatgroupScreen/Components/group_list_ui.dart';
import 'package:flutter/material.dart';

class ChatgroupScreen extends StatefulWidget {
  const ChatgroupScreen({Key? key}) : super(key: key);

  @override
  State<ChatgroupScreen> createState() => _ChatgroupScreenState();
}

class _ChatgroupScreenState extends State<ChatgroupScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
          body: Center(
        child: ChatGroupList(
          isTopBar: true,
        ),
      )),
    );
    ;
  }
}
