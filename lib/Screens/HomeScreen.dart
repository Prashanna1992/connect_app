import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:pratham_app/Pages/CameraPage.dart';
import 'package:pratham_app/Pages/ChatPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this, initialIndex: 1);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ConnectApp"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                child: Text("New Group"),
                value: "New Group",
              ),
              const PopupMenuItem(
                child: Text("New Broadcast"),
                value: "New Broadcast",
              ),
              const PopupMenuItem(
                child: Text("WhatsApp Web"),
                value: "WhatsApp Web",
              ),
              const PopupMenuItem(
                child: Text("Starred Message"),
                value: "Starred Message",
              ),
              const PopupMenuItem(
                child: Text("Settings"),
                value: "Settings",
              ),
            ];
          })
        ],
        bottom: TabBar(
          indicatorColor: Colors.amber.shade400,
          controller: tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: "Message",
            ),
            Tab(
              text: "Status",
            ),
            Tab(
              text: "Calls",
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
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
              icon: const Icon(Icons.camera_alt)),
          ChatPage(),
          Text("Status"),
          Text("Calls")
        ],
      ),
    );
  }
}
