import 'package:flutter/material.dart';

class ContactStatus extends StatelessWidget {
  const ContactStatus(
      {Key? key, required this.name, required this.updatedAt, this.image})
      : super(key: key);
  final String name;
  final String updatedAt;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: CircleAvatar(
          radius: 26,
          backgroundImage: image != null
              ? AssetImage(image!)
              : AssetImage("assets/nopic.png"),
        ),
      ),
      title: Text(
        name,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary),
      ),
      subtitle: Text(
        updatedAt,
        style: TextStyle(
            fontSize: 13,
            color: Colors.grey.shade700,
            fontStyle: FontStyle.italic),
      ),
    );
  }
}
