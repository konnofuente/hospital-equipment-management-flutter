import 'package:evaltech_mobile/Theme/text_theme.dart';
import 'package:evaltech_mobile/screens/ChatgroupScreen/Components/GroupList/components/top_bar.dart';
import 'package:evaltech_mobile/screens/ChatgroupScreen/Components/chat_screen.dart';
import 'package:flutter/material.dart';

import '../../../../Theme/app_theme.dart';
import '../../../../db/db.dart';
import '../../../../utils/navigate_screen.dart';
import '../../../../widget/chat_widget/widget_chat_item.dart';

class ChatGroupList extends StatefulWidget {
  final bool isTopBar;

  const ChatGroupList({Key? key, required this.isTopBar}) : super(key: key);
  @override
  _ChatGroupListState createState() => _ChatGroupListState();
}

class _ChatGroupListState extends State<ChatGroupList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            // smaller light green bottom container
            widget.isTopBar == true
                ? Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Container(
                      height: 119,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: AppColors.lightprimaryblue,
                        borderRadius: BorderRadius.circular(
                          18,
                        ),
                      ),
                    ),
                  )
                : Container(),
            // Big green upper container on the top
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.isTopBar == true ? TopBar() : Container(),
                SizedBox(height: 42),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    right: 15,
                  ),
                  child: Text("Class Chat", style: AppTextTheme.title),
                ),
                // SizedBox(height: -10),
                chatList(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class chatList extends StatelessWidget {
  const chatList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: DB().chatItemList.map((chatItem) {
            return InkWell(
              onTap: () {
                // do something when ChatItems widget is tapped
                NavigationScreen.navigate(context, ChatScreen());
                print("object");
              },
              child: chatItem,
            );
          }).toList(),
        ),
      ),
    );
    // return Expanded(
    //   child: Padding(
    //     padding: const EdgeInsets.only(left: 15.0, right: 15),
    //     child: ListView(
    //       scrollDirection: Axis.vertical,
    //       children: DB().chatItemList.map((chatItem) {
    //         return GestureDetector(
    //           onTap: () {
    //             // do something when ChatItems widget is tapped
    //             NavigationScreen.navigate(context, ChatScreen());
    //             print("object");
    //           },
    //           child: chatItem,
    //         );
    //       }).toList(),
    //     ),
    //   ),
    // );
  }
}
