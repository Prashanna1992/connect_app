import 'dart:async';
import 'package:intl/intl.dart';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:pratham_app/CustomUI/ReplyMessage.dart';
import 'package:pratham_app/CustomUI/UserMessage.dart';
import 'package:pratham_app/Model/ChatModel.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pratham_app/Model/MessageModel.dart';
import 'package:pratham_app/Pages/CameraPage.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class IndividualPage extends StatefulWidget {
  const IndividualPage(
      {Key? key, required this.chatModel, required this.sourceChat})
      : super(key: key);
  final ChatModel chatModel;
  final ChatModel sourceChat;

  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show = false;
  bool sendButton = false;
  late IO.Socket socket;
  List<MessageModel> messages = [];
  final TextEditingController _controller = TextEditingController();
  ScrollController _scrollController = ScrollController();

  void connect() {
    socket = IO.io("https://polar-harbor-55611.herokuapp.com/", <String, dynamic>{
      "transports": ["websocket"],
      "autoconnect": false,
    });
    socket.connect();
    socket.onConnect((request) {
      socket.on("sendMessage", (request) {
        setMessage("received", request["message"]);
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
      });
    });
    socket.emit("verifyUser", widget.sourceChat.id);
  }

  void sendMessage(String message, int sourceId, int destinationId) {
    setMessage("sent", message);
    socket.emit("sendMessage", {
      "message": message,
      "sourceId": sourceId,
      "destinationId": destinationId
    });
  }

  void setMessage(String type, String message) {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat().add_jm().format(now);
    MessageModel messageModel =
        MessageModel(type: type, message: message, time: formattedTime);
    setState(() {
      setState(() {
        messages.add(messageModel);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    print("Attempting to connect");
    connect();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/bg2.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            titleSpacing: 0,
            leadingWidth: 70,
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.arrow_back,
                      size: 24,
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.blueGrey,
                      child: SvgPicture.asset(
                        widget.chatModel.isGroup!
                            ? "assets/groups.svg"
                            : "assets/person.svg",
                        color: Colors.white,
                        height: 20,
                        width: 20,
                      ),
                    )
                  ],
                )),
            title: Container(
              margin: const EdgeInsets.all(7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.chatModel.name ?? "",
                    style: const TextStyle(
                        fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Last seen today at 12:00",
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ),
            actions: [
              const IconButton(onPressed: null, icon: Icon(Icons.videocam)),
              const IconButton(onPressed: null, icon: Icon(Icons.call)),
              PopupMenuButton<String>(onSelected: (value) {
                print(value);
              }, itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(
                    child: Text("New Group"),
                    value: "New Group",
                  ),
                  const PopupMenuItem(
                    child: Text("Media, Links, Docs"),
                    value: "Media, Links, Docs",
                  ),
                  const PopupMenuItem(
                    child: Text("WhatsApp Web"),
                    value: "WhatsApp Web",
                  ),
                  const PopupMenuItem(
                    child: Text("Search"),
                    value: "Search",
                  ),
                  const PopupMenuItem(
                    child: Text("Mute Notifications"),
                    value: "Mute Notifications",
                  ),
                ];
              })
            ],
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    shrinkWrap: true,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      if (messages[index].type == "sent") {
                        return UserMessage(
                          message: messages[index].message,
                          time: messages[index].time,
                        );
                      } else {
                        return ReplyMessage(
                          message: messages[index].message,
                          time: messages[index].time,
                        );
                      }
                    },
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      // width: MediaQuery.of(context).size.width - 55,
                      child: Card(
                        margin: const EdgeInsets.only(
                            left: 10, right: 3, bottom: 8, top: 5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        child: TextFormField(
                          controller: _controller,
                          onTap: () {},
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              setState(() {
                                sendButton = true;
                              });
                            } else {
                              setState(() {
                                sendButton = false;
                              });
                            }
                          },
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          minLines: 1,
                          decoration: InputDecoration(
                              enabledBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              hintText: "Type message here...",
                              contentPadding: const EdgeInsets.all(10),
                              // prefixIcon: IconButton(
                              //   icon: Icon(Icons.emoji_emotions),
                              //   onPressed: () {
                              //     show = !show;
                              //     print(show);
                              //   },
                              // ),
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (builder) =>
                                                bottomSheet());
                                      },
                                      icon: const Icon(Icons.attach_file)),
                                  IconButton(
                                      onPressed: () async {
                                        await availableCameras().then(
                                          (value) => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => CameraPage(
                                                cameras: value,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      icon: const Icon(Icons.camera_alt))
                                ],
                              )),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: const Color.fromRGBO(15, 185, 177, 1),
                      child: sendButton
                          ? IconButton(
                              icon: const Icon(Icons.send),
                              color: Colors.white,
                              onPressed: () {
                                _scrollController.animateTo(
                                    _scrollController.position.maxScrollExtent,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeOut);
                                sendMessage(
                                  _controller.text,
                                  widget.sourceChat.id!,
                                  widget.chatModel.id!,
                                );
                                setState(() {
                                  sendButton = false;
                                });
                                _controller.clear();
                              },
                            )
                          : IconButton(
                              icon: const Icon(Icons.mic),
                              color: Colors.white,
                              onPressed: () {},
                            ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.all(18),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  iconCreator(
                      Icons.insert_drive_file, Colors.indigo, "Document"),
                  iconCreator(Icons.camera_alt, Colors.pink, "Camera"),
                  iconCreator(Icons.insert_photo, Colors.purple, "Gallery")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  iconCreator(Icons.headset, Colors.orange, "Audio"),
                  iconCreator(Icons.location_pin, Colors.pink, "Location"),
                  iconCreator(Icons.person, Colors.blue, "Contact")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget iconCreator(IconData iconData, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: Icon(
              iconData,
              size: 29,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(text),
        ],
      ),
    );
  }
}
