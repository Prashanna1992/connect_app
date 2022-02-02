import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pratham_app/CustomUI/AvatarCard.dart';
import 'package:pratham_app/CustomUI/ButtonCard.dart';
import 'package:pratham_app/CustomUI/ContactCard.dart';
import 'package:pratham_app/Model/ChatModel.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel> contacts = [
    ChatModel(name: "Prashanna", status: "Working on a flutter project!"),
    ChatModel(name: "Kabita", status: "Interview day tomorrow!"),
    ChatModel(name: "Ujjwal", status: "Project presentation on the way!")
  ];

  List<ChatModel> selectedGroup = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create New Group",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Text(
              "Add participants",
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
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: contacts.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    height: selectedGroup.isNotEmpty ? 90 : 0,
                  );
                }
                index = index - 1;
                return InkWell(
                  onTap: () {
                    if (contacts[index].select == false) {
                      setState(() {
                        contacts[index].select = true;
                        selectedGroup.add(contacts[index]);
                      });
                    } else {
                      setState(() {
                        contacts[index].select = false;
                        selectedGroup.remove(contacts[index]);
                      });
                    }
                  },
                  child: ContactCard(contact: contacts[index]),
                );
              }),
          selectedGroup.isNotEmpty
              ? Column(
                  children: [
                    Container(
                      height: 75,
                      color: Theme.of(context).colorScheme.primary,
                      child: ListView.builder(
                          itemCount: contacts.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            if (contacts[index].select == true) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    contacts[index].select = false;
                                    selectedGroup.remove(contacts[index]);
                                  });
                                },
                                child: AvatarCard(contact: contacts[index]),
                              );
                            } else {
                              return Container();
                            }
                          }),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
