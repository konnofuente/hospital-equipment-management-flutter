import 'package:flutter/material.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> creaContactUsate() => _ContactUsScreenState();
  
  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ContactUs Screen", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        actions: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: const CircleAvatar(
              backgroundImage: AssetImage("assets/Images/profile.png"),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Text("ContactUsScreen")
        ],
      ),
    );
  }
}
