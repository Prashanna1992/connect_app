import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pratham_app/CustomUI/ButtonCard.dart';
import 'package:pratham_app/CustomUI/ContactCard.dart';
import 'package:pratham_app/Model/ChatModel.dart';
import 'package:pratham_app/Screens/CreateGroup.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({Key? key}) : super(key: key);

  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts = [
      ChatModel(name: "Prashanna", status: "Working on a flutter project!"),
      ChatModel(name: "Kabita", status: "Interview day tomorrow!"),
      ChatModel(name: "Ujjwal", status: "Project presentation on the way!")
    ];

    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Contact",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Text(
              "245 Contacts",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 26,
              )),
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                child: Text("Invite a Friend"),
                value: "Invite a Friend",
              ),
              const PopupMenuItem(
                child: Text("Contacts"),
                value: "Contacts",
              ),
              const PopupMenuItem(
                child: Text("Refresh"),
                value: "Refresh",
              ),
              const PopupMenuItem(
                child: Text("Help"),
                value: "Help",
              ),
            ];
          })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: ListView.builder(
            itemCount: contacts.length + 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => CreateGroup()));
                  },
                  child: const ButtonCard(
                    name: "New Group",
                    iconData: Icons.group_add,
                  ),
                );
              } else if (index == 1) {
                return InkWell(
                  onTap: () {},
                  child: const ButtonCard(
                    name: "New Contact",
                    iconData: Icons.person_add,
                  ),
                );
              }
              return ContactCard(contact: contacts[index - 2]);
            }),
      ),
    );
  }
}
