import 'package:flutter/material.dart';
import 'package:pratham_app/CustomUI/CustomCard.dart';
import 'package:pratham_app/Model/ChatModel.dart';
import 'package:pratham_app/Screens/SelectContact.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key, required this.chats, required this.sourceChat})
      : super(key: key);
  final List<ChatModel> chats;
  final ChatModel sourceChat;
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (builder) => const SelectContact()));
          },
          child: const Icon(Icons.chat),
        ),
        body: ListView.builder(
            itemCount: widget.chats.length,
            itemBuilder: (context, index) => CustomCard(
                  sourceChat: widget.sourceChat,
                  chatModel: widget.chats[index],
                )));
  }
}
