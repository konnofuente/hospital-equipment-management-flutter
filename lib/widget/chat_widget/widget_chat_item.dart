import 'package:evaltech_mobile/Theme/app_theme.dart';
import 'package:evaltech_mobile/screens/ChatgroupScreen/Components/chat_screen.dart';
import 'package:evaltech_mobile/utils/navigate_screen.dart';
import 'package:flutter/material.dart';

Widget ChatItems(
  name,
  message,
  unreadMessageCount,
  unreadMessageTime,
  online,
) {
  return Container(
    height: 80,
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
            ),
            online
                ? Positioned(
                    right: 2,
                    bottom: 4,
                    child: Container(
                      height: 14,
                      width: 14,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 1,
                              color: Colors.white,
                              spreadRadius: 2)
                        ],
                        color: AppColors.primaryblue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 0,
            right: 0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 17,
                  height: 1.1,
                  fontWeight: FontWeight.w600,
                ),
              ),
              message.length > 60 ? SizedBox(height: 4) : SizedBox(height: 10),
              Container(
                width: 200,
                child: Text(
                  message,
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 55,
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 12),
                child: Text(
                  unreadMessageTime,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              unreadMessageCount > 0
                  ? Container(
                      height: 32,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                            colors: [
                              AppColors.primaryblue,
                              AppColors.lightprimaryblue,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                      ),
                      child: Center(
                        child: Text(
                          unreadMessageCount.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 19,
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ],
    ),
  );
}
