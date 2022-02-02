import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pratham_app/Model/ChatModel.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({Key? key, required this.name, required this.iconData})
      : super(key: key);
  final String name;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blueGrey[200],
        radius: 25,
        child: Icon(
          iconData,
          color: Colors.white,
          size: 26,
        ),
      ),
      title: Text(
        name,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
