import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pratham_app/Model/ChatModel.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key, required this.contact}) : super(key: key);
  final ChatModel contact;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 100,
        width: 50,
        child: Stack(
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).backgroundColor,
              radius: 25,
              child: SvgPicture.asset(
                "assets/person.svg",
                color: Theme.of(context).colorScheme.secondary,
                height: 30,
                width: 30,
              ),
            ),
            contact.select
                ? Positioned(
                    bottom: 4,
                    right: 1,
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      radius: 10,
                      child: Icon(
                        Icons.check,
                        color: Theme.of(context).colorScheme.background,
                        size: 12,
                      ),
                    ))
                : Container()
          ],
        ),
      ),
      title: Text(
        contact.name ?? " ",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        contact.status ?? "",
        style: TextStyle(fontSize: 13),
      ),
    );
  }
}
