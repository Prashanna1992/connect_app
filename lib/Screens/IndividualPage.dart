import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pratham_app/CustomUI/UserMessage.dart';
import 'package:pratham_app/Model/ChatModel.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pratham_app/Pages/CameraPage.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({Key? key, required this.chatModel}) : super(key: key);
  final ChatModel chatModel;

  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show = false;
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
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                ListView(
                  children: [UserMessage()],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 55,
                            child: Card(
                              margin: const EdgeInsets.only(
                                  left: 10, right: 3, bottom: 8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                minLines: 1,
                                decoration: InputDecoration(
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
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (builder) =>
                                                      bottomSheet());
                                            },
                                            icon:
                                                const Icon(Icons.attach_file)),
                                        IconButton(
                                            onPressed: () async {
                                              await availableCameras().then(
                                                (value) => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        CameraPage(
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
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8, right: 2),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor:
                                  const Color.fromRGBO(15, 185, 177, 1),
                              child: IconButton(
                                icon: const Icon(Icons.mic),
                                color: Colors.white,
                                onPressed: () {},
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
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
