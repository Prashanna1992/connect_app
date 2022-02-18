import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/material.dart';
import 'package:pratham_app/CustomUI/StatusPage/ContactStatus.dart';
import 'package:pratham_app/CustomUI/StatusPage/HeadMyStatus.dart';

class StatusPage extends StatefulWidget {
  StatusPage({Key? key}) : super(key: key);

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 48,
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.primary,
              elevation: 8,
              onPressed: () {},
              child: Icon(
                Icons.edit,
                color: Theme.of(context).colorScheme.primaryVariant,
              ),
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Theme.of(context).colorScheme.primary,
            elevation: 5,
            child: const Icon(Icons.camera_alt),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const HeadMyStatus(),
            const Divider(
              height: 20,
              thickness: .1,
              indent: 20,
              endIndent: 20,
              color: Colors.black,
            ),
            label("Recent Status Updates"),
            ContactStatus(
              name: "Sahara",
              updatedAt: timeago
                  .format(DateTime.now().subtract(const Duration(minutes: 14))),
              image: "assets/motu.jpg",
            ),
            ContactStatus(
              name: "Kabita",
              updatedAt: timeago
                  .format(DateTime.now().subtract(const Duration(minutes: 28))),
              image: "assets/missramen.jpg",
            ),
            const Divider(
              height: 20,
              thickness: .1,
              indent: 20,
              endIndent: 20,
              color: Colors.black,
            ),
            label("Viewed Updates"),
            ContactStatus(
              name: "Ujjwal",
              updatedAt: timeago
                  .format(DateTime.now().subtract(const Duration(minutes: 35))),
            ),
          ],
        ),
      ),
    );
  }

  Widget label(String labelName) {
    return Container(
      alignment: Alignment.center,
      height: 33,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
        child: Text(
          labelName,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
