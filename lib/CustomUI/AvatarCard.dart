import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pratham_app/Model/ChatModel.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({Key? key, required this.contact}) : super(key: key);
  final ChatModel contact;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
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
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 10,
                    child: Icon(
                      Icons.clear,
                      color: Theme.of(context).colorScheme.background,
                      size: 10,
                    ),
                  ))
            ],
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            contact.name ?? "",
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
