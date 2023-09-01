import 'package:flutter/material.dart';

class ChatBottomTab extends StatelessWidget {
  const ChatBottomTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      // MediaQuery.of(context).size.height/2,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: Container(
          height: 75,
          width: MediaQuery.of(context).size.width - 16,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(color: Colors.grey, blurRadius: 2, spreadRadius: 2),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      height: 6,
                      width: (MediaQuery.of(context).size.width) / 7,
                      color: Colors.white),
                  Container(
                      height: 6,
                      width: (MediaQuery.of(context).size.width) / 7,
                      color: Colors.white),
                  Container(
                      height: 6,
                      width: (MediaQuery.of(context).size.width) / 7,
                      color: Colors.green.shade600),
                  Container(
                      height: 6,
                      width: (MediaQuery.of(context).size.width) / 7,
                      color: Colors.white)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16, top: 12, right: 8),
                    child: Column(
                      children: [
                        Icon(Icons.home, color: Colors.grey.shade400),
                        SizedBox(height: 3),
                        Text(
                          "Home",
                          style: TextStyle(
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16, top: 12, right: 8),
                    child: Column(
                      children: [
                        Icon(Icons.supervisor_account,
                            color: Colors.grey.shade400),
                        SizedBox(height: 3),
                        Text(
                          "Friends",
                          style: TextStyle(
                            color: Colors.grey.shade400,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16, top: 12, right: 8),
                    child: Column(
                      children: [
                        Icon(Icons.message, color: Colors.green.shade600),
                        SizedBox(height: 3),
                        Text(
                          "Messages",
                          style: TextStyle(
                            color: Colors.green.shade600,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16, top: 12, right: 8),
                    child: Column(
                      children: [
                        Icon(Icons.settings, color: Colors.grey.shade400),
                        SizedBox(height: 3),
                        Text(
                          "Settings",
                          style: TextStyle(
                            color: Colors.grey.shade400,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
