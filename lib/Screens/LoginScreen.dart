import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pratham_app/CustomUI/ButtonCard.dart';
import 'package:pratham_app/Model/ChatModel.dart';
import 'package:pratham_app/Screens/HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late ChatModel sourceChat;
  List<ChatModel> chats = [
    ChatModel(
      name: "Prashanna",
      icon: "person.svg",
      isGroup: false,
      time: "5:00pm",
      status: "",
      id: 1,
      currentMessage: "Hey there!",
    ),
    ChatModel(
        name: "Kabita",
        icon: "person.svg",
        isGroup: false,
        time: "10:00pm",
        status: "",
        id: 2,
        currentMessage: "Hi!"),
    ChatModel(
        name: "Ujjwal",
        icon: "person.svg",
        isGroup: false,
        time: "5:00pm",
        status: "",
        id: 3,
        currentMessage: "k cha k cha"),
    ChatModel(
        name: "Sahara",
        icon: "person.svg",
        isGroup: false,
        time: "6:00pm",
        status: "",
        id: 5,
        currentMessage: "Oi!"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) => InkWell(
              onTap: () {
                sourceChat = chats.removeAt(index);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => HomeScreen(
                              chats: chats,
                              sourceChat: sourceChat,
                            )));
              },
              child:
                  ButtonCard(name: chats[index].name, iconData: Icons.person))),
    );
  }
}
