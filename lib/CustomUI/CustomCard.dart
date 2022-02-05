import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pratham_app/Model/ChatModel.dart';
import 'package:pratham_app/Screens/IndividualPage.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {Key? key, required this.chatModel, required this.sourceChat})
      : super(key: key);
  final ChatModel chatModel;
  final ChatModel sourceChat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => IndividualPage(
                      chatModel: chatModel,
                      sourceChat: sourceChat,
                    )));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              child: SvgPicture.asset(
                chatModel.isGroup! ? "assets/groups.svg" : "assets/person.svg",
                color: Colors.white,
                height: 20,
                width: 20,
              ),
              backgroundColor: Colors.blueGrey,
            ),
            trailing: Text(chatModel.time ?? ""),
            title: Text(
              chatModel.name ?? "",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Row(
              children: [
                const Icon(Icons.done_all),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  chatModel.currentMessage ?? " ",
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20, left: 80),
            child: Divider(
              thickness: 1,
            ),
          )
        ],
      ),
    );
  }
}
