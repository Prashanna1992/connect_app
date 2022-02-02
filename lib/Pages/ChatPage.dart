import 'package:flutter/material.dart';
import 'package:pratham_app/CustomUI/CustomCard.dart';
import 'package:pratham_app/Model/ChatModel.dart';
import 'package:pratham_app/Screens/SelectContact.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
        name: "Prashanna",
        icon: "person.svg",
        isGroup: false,
        time: "5:00pm",
        status: "",
        currentMessage: "Hey there!"),
    ChatModel(
        name: "Kabita",
        icon: "person.svg",
        isGroup: false,
        time: "10:00pm",
        status: "",
        currentMessage: "Hi!"),
    ChatModel(
        name: "Ujjwal",
        icon: "person.svg",
        isGroup: false,
        time: "5:00pm",
        status: "",
        currentMessage: "k cha k cha"),
    ChatModel(
        name: "BIT VIII",
        icon: "group.svg",
        isGroup: true,
        time: "11:30am",
        status:
            "Notice !!!Dear all,Project (VII semester project) internal defense schedule: Date: 2078/10/09(Tomorrow),Time: From sharp 7:00 to 8:30 am (Online).Aru classes hudaina voli. Do prepare well ! Please convey to your friends and be there in sharp time. Thank you.",
        currentMessage: "Hey there!"),
    ChatModel(
        name: "Sahara",
        icon: "person.svg",
        isGroup: false,
        time: "6:00pm",
        status: "",
        currentMessage: "Oi!"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (builder) => SelectContact()));
          },
          child: const Icon(Icons.chat),
        ),
        body: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) => CustomCard(
                  chatModel: chats[index],
                )));
  }
}
