import 'package:gestion_hopital/Theme/app_theme.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Widget> messages = [];
  TextEditingController userText = TextEditingController();

  void addMessage(String text, String sender) {
    setState(() {
      messages.add(messageFormatting(text, sender));
    });
  }

  Widget messageFormatting(String text, String sender) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: sender == "me" ? AppColors.primaryblue : Colors.grey,
            ),
          ),
          SizedBox(width: 10),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: sender == "me"
                    ? AppColors.primaryblue
                    : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: sender == "me" ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove back button
        title: Text("Chat"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                return messages[index];
              },
            ),
          ),
          Divider(height: 1),
          Container(
            color: Colors.white,
            child: Row(
              children: [
                Icon(Icons.attach_file, color: Colors.grey),
                SizedBox(width: 4),
                Flexible(
                  child: TextField(
                    controller: userText,
                    onSubmitted: (text) {
                      addMessage(text, "me");
                    },
                    style: TextStyle(color: Colors.black, fontSize: 15.0),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type your message...',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Icon(
                    Icons.mic,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      addMessage(userText.text, "me");
                    },
                    child: Icon(Icons.send, color: Colors.greenAccent[700]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
